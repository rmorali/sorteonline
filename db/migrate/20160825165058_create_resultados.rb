class CreateResultados < ActiveRecord::Migration
  def change
    create_table :resultados do |t|
      t.string :tipo
    end
  end
end
