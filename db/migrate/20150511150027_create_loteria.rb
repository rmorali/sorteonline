class CreateLoteria < ActiveRecord::Migration
  def change
    create_table :loteria do |t|
      t.string :nome
      t.string :sigla
      t.integer :qtd_min_dezenas
      t.integer :qtd_max_dezenas
      t.integer :min_soma
      t.integer :max_soma
      t.integer :max_pares
      t.integer :min_pares
      t.integer :max_impares
      t.integer :min_impares
      t.integer :min_mais_sorteados
      t.integer :max_mais_sorteados
      t.integer :min_menos_sorteados
      t.integer :max_menos_sorteados
      t.integer :min_colunas_cheias
      t.integer :max_colunas_cheias
      t.integer :min_linhas_cheias
      t.integer :max_linhas_cheias
      t.integer :min_colunas_vazias
      t.integer :max_colunas_vazias
      t.integer :min_linhas_vazias
      t.integer :max_linhas_vazias
      t.integer :min_mesma_linha
      t.integer :max_mesma_linha
      t.integer :min_mesma_coluna
      t.integer :max_mesma_coluna
      t.integer :min_coluna_esquerda_direita
      t.integer :min_digitos
      t.integer :max_digitos
      t.integer :min_sequencia
      t.integer :max_sequencia
      t.text :linhas
      t.text :colunas
      t.text :colunas_da_esquerda
      t.text :colunas_da_direita
      t.text :menos_sorteados
      t.text :mais_sorteados
      t.text :multiplos
    end
  end
end

