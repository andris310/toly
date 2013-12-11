# encoding: utf-8

class VideoUploader < CarrierWave::Uploader::Base
  self.fog_public = false
  self.fog_authenticated_url_expiration = 120

  storage :fog

  def fog_directory
    ENV['AWS_VIDEO_BUCKET']
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  include CarrierWave::MimeTypes
  process :set_content_type

end