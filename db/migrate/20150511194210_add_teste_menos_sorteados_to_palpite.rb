class AddTesteMenosSorteadosToPalpite < ActiveRecord::Migration
  def change
    add_column :palpites, :teste_menos_sorteados, :boolean
  end
end
