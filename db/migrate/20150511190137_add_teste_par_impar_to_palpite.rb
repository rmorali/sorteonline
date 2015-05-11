class AddTesteParImparToPalpite < ActiveRecord::Migration
  def change
    add_column :palpites, :teste_pares_impares, :boolean
  end
end
