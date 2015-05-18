class AddTesteSomaDosDigitosToPalpite < ActiveRecord::Migration
  def change
    add_column :palpites, :teste_soma_dos_digitos, :boolean
  end
end
