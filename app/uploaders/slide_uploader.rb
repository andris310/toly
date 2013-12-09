# encoding: utf-8

class SlideUploader < CarrierWave::Uploader::Base

self.fog_public = true
  self.fog_authenticated_url_expiration = 120

  include CarrierWave::RMagick

  # Choose what kind of storage to use for this uploader:
  # storage :file
  storage :fog

  def fog_directory
    ENV['SLIDE_BUCKET']
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  include CarrierWave::MimeTypes
  process :set_content_type

  version :thumb do
    process :resize_to_fill => [150, 100]
  end

  version :large do
    process :resize_to_fill => [1100, 600]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
