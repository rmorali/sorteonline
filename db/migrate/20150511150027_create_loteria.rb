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
      t.integer :min_coluna_esquerda_direita
      t.integer :min_digitos
      t.integer :max_digitos
      t.integer :max_fibonacci
      t.integer :min_fibonacci
      t.integer :max_fibonacci
      t.integer :min_fibonacci
      t.integer :max_numeros_primos
      t.integer :min_numeros_primos
      t.integer :max_numeros_consecutivos
      t.integer :min_quadrantes
      t.text :linhas
      t.text :colunas
      t.text :quadrantes
      t.string :menos_sorteados
      t.string :mais_sorteados
      t.string :multiplos
      t.string :fibonacci
      t.string :numeros_primos
    end
  end
end

