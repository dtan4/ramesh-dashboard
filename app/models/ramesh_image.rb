class RameshImage < ActiveRecord::Base
  validates :ramesh_image, presence: true
  validates :image_datetime, presence: true, uniqueness: true

  mount_uploader :ramesh_image, RameshImageUploader
end
