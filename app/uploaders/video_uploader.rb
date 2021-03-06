# encoding: utf-8

class VideoUploader < CarrierWave::Uploader::Base
  include CarrierWaveDirect::Uploader
  self.fog_public = false
  self.fog_authenticated_url_expiration = 120
  self.max_file_size     = 2300.megabytes

  def fog_directory
    ENV['AWS_VIDEO_BUCKET']
  end

  if Rails.env.production?
    def store_dir
      "uploads/production_#{model.class.to_s.underscore}"
    end
  end

  if Rails.env.development?
    def store_dir
      "uploads/development_#{model.class.to_s.underscore}"
    end
  end

  def move_to_cache
    true
  end
  def move_to_store
    true
  end

  include CarrierWave::MimeTypes
  process :set_content_type

  def extension_white_list
    %w(mov)
  end

end