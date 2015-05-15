class CreatePalpite < ActiveRecord::Migration
  def change
    create_table :palpites do |t|
      t.integer :bolao_id
      t.string :dezenas
      t.integer :pontos
      t.boolean :teste_soma
      t.boolean :teste_par_impar
      t.boolean :teste_mais_sorteados
      t.boolean :teste_menos_sorteados
      t.boolean :teste_colunas_cheias
      t.boolean :teste_colunas_vazias
      t.boolean :teste_linhas_cheias
      t.boolean :teste_linhas_vazias
      t.boolean :teste_fibonacci
      t.boolean :teste_numeros_primos
      t.boolean :teste_numeros_consecutivos
      t.boolean :teste_quadrantes
      t.boolean :teste_multiplos
      t.boolean :teste_distancia
      t.boolean :teste_intervalos
    end
  end
end
