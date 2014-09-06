class WelcomeController < ApplicationController
  def index
    origin = Time.now

    @images = RameshImage.where(image_datetime: (origin - 2.hours)..origin).order(image_datetime: :desc)
    @image_datetimes = RameshImage.all.order(image_datetime: :desc).group_by { |image| image.strftime("%Y-%m-%d") }.keys
  end
end
