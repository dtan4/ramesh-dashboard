class WelcomeController < ApplicationController
  def index
    @images = RameshImage.order(image_datetime: :desc)
  end
end
