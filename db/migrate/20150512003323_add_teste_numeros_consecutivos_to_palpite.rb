class AddTesteNumerosConsecutivosToPalpite < ActiveRecord::Migration
  def change
    add_column :palpites, :teste_numeros_consecutivos, :boolean
  end
end
