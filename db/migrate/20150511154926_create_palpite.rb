class CreatePalpite < ActiveRecord::Migration
  def change
    create_table :palpites do |t|
      t.integer :id_bolao
      t.text :dezenas
      t.integer :pontos
    end
  end
end
