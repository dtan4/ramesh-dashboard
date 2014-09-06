class WelcomeController < ApplicationController
  def index
    origin = Time.now

    @images = RameshImage.where(image_datetime: (origin - 2.hours)..origin).order(image_datetime: :desc)
  end
end
