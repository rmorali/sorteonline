class ResultadoPalpite < ActiveRecord::Base

  belongs_to :resultado

  def dezenas_do_resultado
    numeros = []
    self.dezenas.split.each do |dezena|
      numeros << dezena.to_i
    end
    2.times { numeros.delete_at(0) }
    numeros.delete(0)
    numeros.sort
  end
end
