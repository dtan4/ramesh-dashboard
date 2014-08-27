require "ramesh"
require "tempfile"
require "time"

class Tasks::PostImageTask
  class << self
    def execute
      tmpfile = Tempfile.open(%W(#{image_name} .jpg))
      download_image(image_name, File.dirname(tmpfile), File.basename(tmpfile))
      image = RameshImage.create(image_datetime: Time.parse(image_name))
      image.ramesh_image = File.new(tmpfile.path)

      unless image.save
        raise RuntimeError, image.errors.full_messages
      end
    rescue
      tmpfile.close! if File.exists?(tmpfile)
      raise
    end

    private

    def image_name
      return @image_name if @image_name

      five_minutes_ago = (Time.now - 5.minutes).strftime("%Y%m%d%H%M").to_i
      @image_name = (five_minutes_ago - five_minutes_ago % 5).to_s
    end

    def download_image(image_name, dir, filename)
      image = Ramesh::Image.new(image_name)
      image.save(dir, filename)
    end
  end
end
