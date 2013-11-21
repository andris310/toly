# encoding: utf-8

class VideoUploader < CarrierWave::Uploader::Base

  # storage :file
  storage :fog

  def fog_directory
    ENV['AWS_VIDEO_BUCKET']
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

end
