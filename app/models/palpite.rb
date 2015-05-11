class Palpite < ActiveRecord::Base
  belongs_to :bolao

  after_create :analises

  def dezenas_do_palpite
    numeros = []
    self.dezenas.split(' ', self.qtd_dezenas + 2).each do |dezena|
      numeros << dezena.to_i
    end
    numeros.delete(0)
    numeros
  end

  def qtd_dezenas
    self.bolao.parametros.qtd_max_dezenas
  end

  def parametros
    self.bolao.parametros
  end

  def analises
    self.analisa_soma
  end

  def analisa_soma
    soma = 0
    self.dezenas_do_palpite.each do |dezenas|
      soma += dezenas
    end
    self.teste_soma = true if soma > self.parametros.min_soma && soma < self.parametros.max_soma
    self.save
  end
end

