class AddTestePremioFaixa2ToPalpites < ActiveRecord::Migration
  def change
    add_column :palpites, :teste_premio_faixa2, :integer
  end
end
