class CreatePalpite < ActiveRecord::Migration
  def change
    create_table :palpites do |t|
      t.integer :bolao_id
      t.string :dezenas
      t.integer :pontos
    end
  end
end
