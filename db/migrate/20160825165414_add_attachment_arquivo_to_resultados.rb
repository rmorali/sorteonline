class AddAttachmentArquivoToResultados < ActiveRecord::Migration
  def self.up
    change_table :resultados do |t|
      t.attachment :arquivo
    end
  end

  def self.down
    remove_attachment :resultados, :arquivo
  end
end
