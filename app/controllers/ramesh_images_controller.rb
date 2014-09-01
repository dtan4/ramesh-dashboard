class RameshImagesController < ApplicationController
  def show
    @image = RameshImage.find_by(image_datetime: Time.parse(params[:image_datetime]))
  end
end
