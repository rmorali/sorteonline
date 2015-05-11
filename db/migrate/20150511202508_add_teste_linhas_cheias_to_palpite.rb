class AddTesteLinhasCheiasToPalpite < ActiveRecord::Migration
  def change
    add_column :palpites, :teste_linhas_cheias, :boolean
  end
end
