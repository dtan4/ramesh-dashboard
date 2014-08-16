# encoding: utf-8

class RameshImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def filename
    # YYYYmmddHHMM.jpg
    if /\A(?<date>\d{12}).*(?<ext>\.\w+)\z/ =~ original_filename
      "#{date}#{ext}"
    else
      original_filename
    end
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_fit => [200, 200]
  end
end
