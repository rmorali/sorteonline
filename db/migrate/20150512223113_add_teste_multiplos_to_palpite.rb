class AddTesteMultiplosToPalpite < ActiveRecord::Migration
  def change
    add_column :palpites, :teste_multiplos, :boolean
  end
end
