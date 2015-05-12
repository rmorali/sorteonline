class Palpite < ActiveRecord::Base
  belongs_to :bolao

  after_create :analises

  def dezenas_do_palpite
    numeros = []
    self.dezenas.split(' ', self.parametros.qtd_max_dezenas + 2).each do |dezena|
      numeros << dezena.to_i
    end
    2.times { numeros.delete_at(0) }
    numeros
  end

  def qtd_dezenas_do_palpite
    self.dezenas_do_palpite.count
  end

  def parametros
    self.bolao.parametros
  end

  def analises
    self.analisa_soma
    self.analisa_pares_impares
    self.analisa_mais_sorteados
    self.analisa_menos_sorteados
    self.analisa_colunas_cheias
    self.analisa_colunas_vazias
    self.analisa_linhas_cheias
    self.analisa_linhas_vazias
    self.analisa_fibonacci
    self.analisa_numeros_primos
    self.analisa_numeros_consecutivos
  end

  def analisa_soma
    soma = 0
    self.dezenas_do_palpite.each do |dezena|
      soma += dezena
    end
    if soma > self.parametros.min_soma && soma < self.parametros.max_soma
      self.teste_soma = true
      self.save
    end
    "#{soma} - #{teste_soma}"
  end

  def analisa_pares_impares
  total_pares = 0
  total_impares = 0
    self.dezenas_do_palpite.each do |dezena|
      total_pares += 1 if dezena.even?
      total_impares += 1 if dezena.odd?
    end
    if ( total_pares >= self.parametros.min_pares && total_pares <= self.parametros.max_pares ) && ( total_impares >= self.parametros.min_impares && total_impares <= self.parametros.max_impares )
      self.teste_pares_impares = true
      self.save
    end
    "#{total_pares} / #{total_impares} - #{self.teste_pares_impares}"
  end

  def analisa_mais_sorteados
    qtd_mais_sorteados =  qtd_dezenas_do_palpite - (self.dezenas_do_palpite - self.parametros.mais_sorteados).length
    if qtd_mais_sorteados >= self.parametros.min_mais_sorteados && qtd_mais_sorteados <= self.parametros.max_mais_sorteados
      self.teste_mais_sorteados = true
      self.save
    end
    "#{qtd_mais_sorteados} - #{self.teste_mais_sorteados}"
  end

  def analisa_menos_sorteados
    qtd_menos_sorteados =  qtd_dezenas_do_palpite - (self.dezenas_do_palpite - self.parametros.menos_sorteados).length
    if qtd_menos_sorteados >= self.parametros.min_menos_sorteados && qtd_menos_sorteados <= self.parametros.max_menos_sorteados
      self.teste_menos_sorteados = true
      self.save
    end
    "#{qtd_menos_sorteados} - #{self.teste_menos_sorteados}"
  end

  def analisa_colunas_cheias
    total_colunas_cheias = 0
    self.parametros.colunas.each do |coluna|
      total_colunas_cheias += 1 if (coluna - self.dezenas_do_palpite).length == 0
    end
    if total_colunas_cheias >= self.parametros.min_colunas_cheias && total_colunas_cheias <= self.parametros.max_colunas_cheias
      self.teste_colunas_cheias = true
      self.save
    end
    "#{total_colunas_cheias} - #{self.teste_colunas_cheias}"
  end

  def analisa_colunas_vazias
    total_colunas_vazias = 0
    self.parametros.colunas.each do |coluna|
      vazio = coluna.length
      total_colunas_vazias += 1 if (coluna - self.dezenas_do_palpite).length == vazio
    end
    if total_colunas_vazias >= self.parametros.min_colunas_vazias && total_colunas_vazias <= self.parametros.max_colunas_vazias
      self.teste_colunas_vazias = true
      self.save
    end
    "#{total_colunas_vazias} - #{self.teste_colunas_vazias}"
  end

  def analisa_linhas_cheias
    total_linhas_cheias = 0
    self.parametros.linhas.each do |linha|
      total_linhas_cheias += 1 if (linha - self.dezenas_do_palpite).length == 0
    end
    if total_linhas_cheias >= self.parametros.min_linhas_cheias && total_linhas_cheias <= self.parametros.max_linhas_cheias
      self.teste_linhas_cheias = true
      self.save
    end
    "#{total_linhas_cheias} - #{self.teste_linhas_cheias}"
  end

  def analisa_linhas_vazias
    total_linhas_vazias = 0
    self.parametros.linhas.each do |linha|
      vazio = linha.length
      total_linhas_vazias += 1 if (linha - self.dezenas_do_palpite).length == vazio
    end
    if total_linhas_vazias >= self.parametros.min_linhas_vazias && total_linhas_vazias <= self.parametros.max_linhas_vazias
      self.teste_linhas_vazias = true
      self.save
    end
    "#{total_linhas_vazias} - #{self.teste_linhas_vazias}"
  end

  def analisa_fibonacci
    qtd_fibonacci =  qtd_dezenas_do_palpite - (self.dezenas_do_palpite - self.parametros.fibonacci).length
    if qtd_fibonacci >= self.parametros.min_fibonacci && qtd_fibonacci <= self.parametros.max_fibonacci
      self.teste_fibonacci = true
      self.save
    end
    "#{qtd_fibonacci} - #{self.teste_fibonacci}"
  end

  def analisa_numeros_primos
    qtd_numeros_primos =  qtd_dezenas_do_palpite - (self.dezenas_do_palpite - self.parametros.numeros_primos).length
    if qtd_numeros_primos >= self.parametros.min_numeros_primos && qtd_numeros_primos <= self.parametros.max_numeros_primos
      self.teste_numeros_primos = true
      self.save
    end
    "#{qtd_numeros_primos} - #{self.teste_numeros_primos}"
  end

  def analisa_numeros_consecutivos
    a = self.dezenas_do_palpite.sort
    prev = a[0]
    filtro = a.slice_before { |cur|
    prev, prev2 = cur, prev  # one step further
    prev2 + 1 != prev        # two ago != one ago ? --> new slice
  }.to_a
    if filtro.any? { |x| x.length >= self.parametros.max_numeros_consecutivos }
      self.teste_numeros_consecutivos = true
      self.save
     "#{self.parametros.max_numeros_consecutivos} - #{self.teste_numeros_consecutivos}"
    end
  end


end

