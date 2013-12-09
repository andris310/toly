# encoding: utf-8

class PictureUploader < CarrierWave::Uploader::Base
  self.fog_public = true
  # self.fog_authenticated_url_expiration = 120

  include CarrierWave::RMagick

  # Choose what kind of storage to use for this uploader:
  # storage :file
  storage :fog

  def fog_directory
    ENV['AWS_BUCKET']
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  include CarrierWave::MimeTypes
  process :set_content_type

  config.asset_host = 'http://d1ymc90vp1z5i0.cloudfront.net'

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))

  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_fit => [150, 150]
  end

  version :medium do
    process :resize_to_fit => [300, 300]
  end

  version :large do
    process :resize_to_fit => [500, 500]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:

  def extension_white_list
    %w(jpg jpeg gif png)
  end


end
