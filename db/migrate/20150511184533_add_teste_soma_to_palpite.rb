class AddTesteSomaToPalpite < ActiveRecord::Migration
  def change
    add_column :palpites, :teste_soma, :boolean
  end
end
