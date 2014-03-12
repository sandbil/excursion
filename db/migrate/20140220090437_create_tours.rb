class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string :name, :null => false
      t.text :description,  :null => false
      t.decimal :price, precision: 8, scale: 2
      t.integer :city_id
      t.integer :category_id
      t.timestamps
    end
  end
end
