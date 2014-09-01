class WelcomeController < ApplicationController
  def index
    @images = RameshImage.order(image_datetime: :desc).group_by do |image|
      image.image_datetime.strftime("%Y-%m-%d")
    end
  end
end
