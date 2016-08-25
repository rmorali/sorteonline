class AddTestePremioPrincipalToPalpites < ActiveRecord::Migration
  def change
    add_column :palpites, :teste_premio_principal, :integer
  end
end
