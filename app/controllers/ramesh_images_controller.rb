class RameshImagesController < ApplicationController
  def show
    image_datetime = params[:image_datetime]

    if image_datetime.length == 8
      @day = Time.parse(image_datetime)

      @images = RameshImage.where(image_datetime: @day.beginning_of_day..@day.end_of_day).order("image_datetime DESC").group_by do |image|
        image.image_datetime.hour
      end

      return render :show_by_day
    end

    @image = RameshImage.find_by(image_datetime: Time.parse(image_datetime))
  end
end
