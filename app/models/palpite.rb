class Palpite < ActiveRecord::Base
  default_scope {order('teste_premio_principal DESC, teste_premio_faixa1 DESC, teste_premio_faixa2 DESC')}
  belongs_to :bolao

  after_create :analises

  def dezenas_do_palpite
    numeros = []
    self.dezenas.split(' ').each do |dezena|
      numeros << dezena.to_i
    end
    2.times { numeros.delete_at(0) }
    numeros.delete(0)
    numeros.sort
  end

  def qtd_dezenas_do_palpite
    self.dezenas_do_palpite.count
  end

  def parametros
    self.bolao.parametros
  end

  def analises
    self.analisa_soma
    self.analisa_soma_dos_digitos
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
    self.analisa_quadrantes
    self.analisa_multiplos
    self.analisa_distancia
    self.analisa_intervalos
    self.analisa_pontuacao
    self.analisa_anteriores
  end

  def analisa_pontuacao
    total = 0
    total += 1 if teste_soma?
    total += 1 if teste_soma_dos_digitos?
    total += 1 if teste_pares_impares?
    total += 1 if teste_mais_sorteados?
    total += 1 if teste_menos_sorteados?
    total += 1 if teste_colunas_cheias?
    total += 1 if teste_colunas_vazias?
    total += 1 if teste_linhas_vazias?
    total += 1 if teste_linhas_cheias?
    total += 1 if teste_fibonacci?
    total += 1 if teste_numeros_primos?
    total += 1 if teste_numeros_consecutivos?
    total += 1 if teste_quadrantes?
    total += 1 if teste_multiplos?
    total += 1 if teste_distancia?
    total += 1 if teste_intervalos?
    self.pontos = (total * 100) / 16
    self.save
  end

  def analisa_soma
    soma = 0
    self.dezenas_do_palpite[0..(self.parametros.qtd_min_dezenas - 1)].each do |dezena|
      soma += dezena
    end
    if ( soma > self.parametros.min_soma && soma < self.parametros.max_soma ) || qtd_dezenas_do_palpite > self.parametros.qtd_min_dezenas
      self.teste_soma = true
      self.save
    else
      self.teste_soma = nil
      self.save
    end
    "#{soma} - #{teste_soma}"
  end

  def analisa_soma_dos_digitos
    soma = 0
    self.dezenas_do_palpite.each do |dezena|
      dezena_string = dezena.to_s
      if dezena_string.length > 1
        soma += dezena_string.first.to_i
        soma += dezena_string.last.to_i
      else
        soma += dezena
      end
    end
    if ( soma > self.parametros.min_soma_dos_digitos && soma < self.parametros.max_soma_dos_digitos ) || qtd_dezenas_do_palpite > self.parametros.qtd_min_dezenas
      self.teste_soma_dos_digitos = true
      self.save
    else
      self.teste_soma_dos_digitos = nil
      self.save
    end
    "#{soma} - #{teste_soma_dos_digitos}"
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
    else
      self.teste_pares_impares = nil
      self.save
    end
    "#{total_pares} / #{total_impares} - #{self.teste_pares_impares}"
  end

  def analisa_mais_sorteados
    qtd_mais_sorteados =  qtd_dezenas_do_palpite - (self.dezenas_do_palpite - self.parametros.mais_sorteados).length
    if qtd_mais_sorteados >= self.parametros.min_mais_sorteados && qtd_mais_sorteados <= self.parametros.max_mais_sorteados
      self.teste_mais_sorteados = true
      self.save
    else
      self.teste_mais_sorteados = nil
      self.save
    end
    "#{qtd_mais_sorteados} - #{self.teste_mais_sorteados}"
  end

  def analisa_menos_sorteados
    qtd_menos_sorteados =  qtd_dezenas_do_palpite - (self.dezenas_do_palpite - self.parametros.menos_sorteados).length
    if qtd_menos_sorteados >= self.parametros.min_menos_sorteados && qtd_menos_sorteados <= self.parametros.max_menos_sorteados
      self.teste_menos_sorteados = true
      self.save
    else
      self.teste_menos_sorteados = nil
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
    else
      self.teste_colunas_cheias = nil
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
    else
      self.teste_colunas_vazias = nil
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
    else
      self.teste_linhas_cheias = nil
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
    else
      self.teste_linhas_vazias = nil
      self.save
    end
    "#{total_linhas_vazias} - #{self.teste_linhas_vazias}"
  end

  def analisa_fibonacci
    qtd_fibonacci =  qtd_dezenas_do_palpite - (self.dezenas_do_palpite - self.parametros.fibonacci).length
    if qtd_fibonacci >= self.parametros.min_fibonacci && qtd_fibonacci <= self.parametros.max_fibonacci
      self.teste_fibonacci = true
      self.save
    else
      self.teste_fibonacci = nil
      self.save
    end
    "#{qtd_fibonacci} - #{self.teste_fibonacci}"
  end

  def analisa_numeros_primos
    qtd_numeros_primos =  qtd_dezenas_do_palpite - (self.dezenas_do_palpite - self.parametros.numeros_primos).length
    if qtd_numeros_primos >= self.parametros.min_numeros_primos && qtd_numeros_primos <= self.parametros.max_numeros_primos
      self.teste_numeros_primos = true
      self.save
    else
      self.teste_numeros_primos = nil
      self.save
    end
    "#{qtd_numeros_primos} - #{self.teste_numeros_primos}"
  end

  def analisa_numeros_consecutivos
    a = self.dezenas_do_palpite.sort
    prev = a[1]
    filtro = a.slice_before { |cur|
    prev, prev2 = cur, prev  # one step further
    prev2 + 1 != prev        # two ago != one ago ? --> new slice
  }.to_a
    if filtro.any? { |x| x.length > self.parametros.max_numeros_consecutivos }
      self.teste_numeros_consecutivos = nil
      self.save
      "+ q #{self.parametros.max_numeros_consecutivos} em seq."
    else
      self.teste_numeros_consecutivos = true
      self.save
      "#{self.teste_numeros_consecutivos}"
    end
  end

  def analisa_quadrantes
    total_quadrantes_usados = 0
    self.parametros.quadrantes.each do |quadrante|
      vazio = quadrante.length
      total_quadrantes_usados += 1 if (quadrante - self.dezenas_do_palpite).length != vazio 
    end
    if total_quadrantes_usados >= self.parametros.min_quadrantes
      self.teste_quadrantes = true
      self.save
    else
      self.teste_quadrantes = nil
      self.save
    end
    "#{total_quadrantes_usados} - #{self.teste_quadrantes}"
  end

  def analisa_multiplos
    acusa_multiplo = 0
    self.parametros.multiplos.each do |m|
      acusa_multiplo = m if self.dezenas_do_palpite.find_all { |dezena| dezena % m == 0 }.length > self.parametros.max_multiplos && self.dezenas_do_palpite.find_all { |dezena| dezena % m == 0 }.length < self.parametros.min_multiplos
    end
    if acusa_multiplo == 0
      self.teste_multiplos = true
      self.save
    else
      self.teste_multiplos = nil
      self.save
      "* #{acusa_multiplo} < #{self.parametros.min_multiplos} ou > #{self.parametros.max_multiplos}" 
    end       
  end

  def analisa_distancia
    valida = true
    distancia = 0
    self.dezenas_do_palpite.in_groups_of(2) do |group|
      distancia = group[1].to_i - group[0].to_i
      valida = nil if distancia > self.parametros.max_distancia
    end
    if valida == true
      self.teste_distancia = true
      self.save
    else
      self.teste_distancia = nil
      self.save
      "> que #{self.parametros.max_distancia}"
    end
  end

  def analisa_intervalos
    valida = true
    dezena_invalida = []
    i = 0
    self.dezenas_do_palpite[0..(qtd_dezenas_do_palpite - 1)].each do |dezena|
      unless dezena >= self.parametros.intervalos[i][0] && dezena <= self.parametros.intervalos[i][1]
        valida = nil
        dezena_invalida = dezena
        break
      end
      i += 1
    end
    if valida == true || qtd_dezenas_do_palpite > self.parametros.qtd_min_dezenas
      self.teste_intervalos = true
      self.save
    else
      self.teste_intervalos = nil
      self.save
      "#{dezena_invalida} <> #{self.parametros.intervalos[i].to_s.gsub('[',' ').gsub(']',' ').gsub(',','-')}"
    end
  end

  def analisa_anteriores
    resultado = Resultado.select { |resultado| resultado.tipo == self.bolao.tipo }
      premio_principal = 0
      premio_faixa_1 = 0
      premio_faixa_2 = 0
      faixa_principal = self.parametros.qtd_min_dezenas
      faixa_1 = self.parametros.qtd_min_dezenas - 1
      faixa_2 = self.parametros.qtd_min_dezenas - 2

    resultado.first.resultado_palpites.each do |r|
      teste = self.dezenas_do_palpite - r.dezenas_do_resultado
      encontrados = self.dezenas_do_palpite.length - teste.length

      case encontrados
        when faixa_principal
          premio_principal += 1
        when faixa_1
          premio_faixa_1 += 1
        when faixa_2
          premio_faixa_2 += 1
      end
      self.teste_premio_principal = premio_principal
      self.teste_premio_faixa1 = premio_faixa_1
      self.teste_premio_faixa2 = premio_faixa_2
      self.save
    end
    "#{self.teste_premio_principal} / #{self.teste_premio_faixa1} / #{self.teste_premio_faixa2}"
  end

end

