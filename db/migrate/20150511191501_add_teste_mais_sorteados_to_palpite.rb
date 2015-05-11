class AddTesteMaisSorteadosToPalpite < ActiveRecord::Migration
  def change
    add_column :palpites, :teste_mais_sorteados, :boolean
  end
end
