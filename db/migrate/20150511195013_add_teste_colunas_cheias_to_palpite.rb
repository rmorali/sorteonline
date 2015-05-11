class AddTesteColunasCheiasToPalpite < ActiveRecord::Migration
  def change
    add_column :palpites, :teste_colunas_cheias, :boolean
  end
end
