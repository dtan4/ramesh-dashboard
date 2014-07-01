class AddIndexImageDatetimeToRameshImages < ActiveRecord::Migration
  def up
    remove_index :ramesh_images, :image_datetime
    add_index :ramesh_images, :image_datetime, unique: true
  end

  def down
    remove_index :ramesh_images, :image_datetime
    add_index :ramesh_images, :image_datetime
  end
end
