class AddTesteIntervalosToPalpites < ActiveRecord::Migration
  def change
    add_column :palpites, :teste_intervalos, :boolean
  end
end
