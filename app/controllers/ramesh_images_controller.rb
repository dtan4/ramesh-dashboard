class RameshImagesController < ApplicationController
  def show
    image_datetime = params[:image_datetime]

    if image_datetime.length == 8
      @day = Time.parse(image_datetime)

      @images = RameshImage.where(image_datetime: @day.beginning_of_day..@day.end_of_day).order("image_datetime DESC")

      return render :show_by_day
    end

    @image = RameshImage.find_by(image_datetime: Time.parse(image_datetime))
  end

  def list
    day = Time.parse(params[:image_date])
    image_url_list = RameshImage
      .where(image_datetime: day.beginning_of_day..day.end_of_day)
      .order(image_datetime: :asc)
      .map { |image| image.ramesh_image.url }

    render json: { error: false, image_url_list: image_url_list }
  rescue Exception => e
    render json: { error: true, message: e.message }
  end
end
