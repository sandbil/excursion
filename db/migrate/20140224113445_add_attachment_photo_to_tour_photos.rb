class AddAttachmentPhotoToTourPhotos < ActiveRecord::Migration
  def self.up
    change_table :tour_photos do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :tour_photos, :photo
  end
end
