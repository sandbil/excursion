class CreateTourPhotos < ActiveRecord::Migration
  def change
    create_table :tour_photos do |t|
      t.integer :tour_id

      t.timestamps
    end
  end
end
