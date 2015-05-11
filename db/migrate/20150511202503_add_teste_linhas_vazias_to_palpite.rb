class AddTesteLinhasVaziasToPalpite < ActiveRecord::Migration
  def change
    add_column :palpites, :teste_linhas_vazias, :boolean
  end
end
