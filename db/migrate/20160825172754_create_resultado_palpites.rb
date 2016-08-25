class CreateResultadoPalpites < ActiveRecord::Migration
  def change
    create_table :resultado_palpites do |t|
      t.integer :resultado_id
      t.string :dezenas
    end
  end
end
