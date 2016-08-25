class AddTestePremioFaixa1ToPalpites < ActiveRecord::Migration
  def change
    add_column :palpites, :teste_premio_faixa1, :integer
  end
end
