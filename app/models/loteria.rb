class Loteria < ActiveRecord::Base
  serialize :linhas
  serialize :colunas
  serialize :menos_sorteados
  serialize :mais_sorteados
  serialize :multiplos
  serialize :fibonacci
  serialize :numeros_primos
  serialize :quadrantes
  serialize :intervalos

  def self.parametros(tipo)
    loteria = find_by sigla: tipo
  end
end
