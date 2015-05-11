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

end

