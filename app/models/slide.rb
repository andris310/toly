class Slide < ActiveRecord::Base
  validates :name, :url, presence: true
  mount_uploader :url, SlideUploader
end
