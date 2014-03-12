class AddPublicToTours < ActiveRecord::Migration
  def change
    add_column :tours, :public, :boolean,  :null => false, :default => false
  end
end
