class CreateRameshImages < ActiveRecord::Migration
  def change
    create_table :ramesh_images do |t|
      t.string :ramesh_image, null: false
      t.datetime :image_datetime, null: false

      t.timestamps
    end
    add_index :ramesh_images, :image_datetime
  end
end
