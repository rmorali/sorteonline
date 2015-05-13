class AddEstritoToBolao < ActiveRecord::Migration
  def change
    add_column :bolaos, :estrito, :boolean
  end
end
