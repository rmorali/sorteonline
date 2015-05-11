class Loteria < ActiveRecord::Base
  serialize  :linhas,
             :colunas,
             :colunas_da_esquerda,
             :colunas_da_direita,
             :menos_sorteados,
             :multiplos
end
