class Loteria < ActiveRecord::Base
  serialize :linhas
  serialize :colunas
  serialize :colunas_da_esquerda
  serialize :colunas_da_direita
  serialize :menos_sorteados
  serialize :mais_sorteados
  serialize :multiplos
  serialize :fibonacci
  serialize :numeros_primos
  belongs_to :bolao

  def self.parametros(tipo)
    loteria = find_by sigla: tipo
  end
end
