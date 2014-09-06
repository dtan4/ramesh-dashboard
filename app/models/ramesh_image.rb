class RameshImage < ActiveRecord::Base
  validates :ramesh_image, presence: true
  validates :image_datetime, presence: true, uniqueness: true

  mount_uploader :ramesh_image, RameshImageUploader

  def next_image
    RameshImage.find_by(image_datetime: self.image_datetime + 5.minutes)
  end

  def previous_image
    RameshImage.find_by(image_datetime: self.image_datetime - 5.minutes)
  end

  def strftime(format)
    self.image_datetime.strftime(format)
  end
end
