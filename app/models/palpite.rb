class Palpite < ActiveRecord::Base
  belongs_to :bolao

  after_create :analises

  def dezenas_do_palpite
    numeros = []
    self.dezenas.split(' ', self.parametros.qtd_max_dezenas + 2).each do |dezena|
      numeros << dezena.to_i
    end
    numeros.delete(0)
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

end

