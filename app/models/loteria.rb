class Loteria < ActiveRecord::Base
  serialize :linhas
  serialize :colunas
  serialize :colunas_da_esquerda
  serialize :colunas_da_direita
  serialize :menos_sorteados
  serialize :multiplos
end
