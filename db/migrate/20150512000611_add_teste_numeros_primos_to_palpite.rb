class AddTesteNumerosPrimosToPalpite < ActiveRecord::Migration
  def change
    add_column :palpites, :teste_numeros_primos, :boolean
  end
end
