class AddTesteFibonacciToPalpite < ActiveRecord::Migration
  def change
    add_column :palpites, :teste_fibonacci, :boolean
  end
end
