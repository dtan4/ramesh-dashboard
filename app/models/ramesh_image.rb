class RameshImage < ActiveRecord::Base
  validates :ramesh_image, presence: true
  validates :image_datetime, presence: true
end
