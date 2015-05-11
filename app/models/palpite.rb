class Palpite < ActiveRecord::Base
  belongs_to :bolao

  def dezenas_do_palpite
    numeros = []
    qtd_dezenas = self.bolao.parametros.qtd_max_dezenas + 2
    self.dezenas.split(' ', qtd_dezenas).each do |dezena|
      numeros << dezena.to_i
    end
    numeros.delete(0)
    numeros
  end
end

