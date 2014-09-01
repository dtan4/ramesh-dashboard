desc "Post recent images"
task :post_recent_images => :environment do
  time_origin = Time.now

  [5, 10, 15].each do |minutes_ago|
    image_name = image_name_of(time_origin, minutes_ago)

    tmpfile = Tempfile.open(%W(#{image_name} .jpg))
    begin
      image_datetime = Time.parse(image_name)
      next if RameshImage.find_by(image_datetime: image_datetime)

      download_image(image_name, File.dirname(tmpfile), File.basename(tmpfile))
      image = RameshImage.create(image_datetime: image_datetime)
      image.ramesh_image = File.new(tmpfile.path)

      raise RuntimeError, image.errors.full_messages unless image.save
    rescue
      tmpfile.close! if File.exists?(tmpfile)
      raise
    end
  end
end

def image_name_of(time_origin, minutes_ago)
  n_minutes_ago = (time_origin - minutes_ago.minutes).strftime("%Y%m%d%H%M").to_i
  @image_name = (n_minutes_ago - n_minutes_ago % 5).to_s
end

def download_image(image_name, dir, filename)
  image = Ramesh::Image.new(image_name)
  image.save(dir, filename)
end
