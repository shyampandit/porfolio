class AddAttachmentAvatarToGalleryphotos < ActiveRecord::Migration
  def self.up
    change_table :galleryphotos do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :galleryphotos, :avatar
  end
end
