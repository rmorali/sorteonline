class AddTesteQuadrantesToPalpite < ActiveRecord::Migration
  def change
    add_column :palpites, :teste_quadrantes, :boolean
  end
end
