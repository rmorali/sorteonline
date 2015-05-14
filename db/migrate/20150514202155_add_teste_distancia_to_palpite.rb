class AddTesteDistanciaToPalpite < ActiveRecord::Migration
  def change
    add_column :palpites, :teste_distancia, :boolean
  end
end
