class AddAttachmentArquivoToBolaos < ActiveRecord::Migration
  def self.up
    change_table :bolaos do |t|
      t.attachment :arquivo
    end
  end

  def self.down
    remove_attachment :bolaos, :arquivo
  end
end
