class WelcomeController < ApplicationController
  def index
    origin = Time.now

    @images = RameshImage.where(image_datetime: (origin - 2.days).beginning_of_day..origin).order(image_datetime: :desc).group_by do |image|
      image.image_datetime.strftime("%Y-%m-%d")
    end
  end
end
