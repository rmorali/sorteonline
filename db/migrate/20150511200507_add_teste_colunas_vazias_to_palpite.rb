class AddTesteColunasVaziasToPalpite < ActiveRecord::Migration
  def change
    add_column :palpites, :teste_colunas_vazias, :boolean
  end
end
