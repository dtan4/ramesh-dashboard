CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'] || ENV['S3_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'] || ENV['S3_SECRET_ACCESS_KEY'],
      region: ENV['AWS_DEFAULT_REGION'] || ENV['AWS_REGION'] || ENV['S3_REGION'],
      path_style: true,
    }

    config.fog_directory = ENV['S3_BUCKET_NAME']
    config.storage :fog
    config.asset_host = ENV['S3_ASSET_HOST'] if ENV['S3_ASSET_HOST']
  else
    config.storage :file
  end
end
