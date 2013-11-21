class Video < ActiveRecord::Base
  has_and_belongs_to_many :products
  validates :title, :description, presence: true
  validates :title, uniqueness: true

  mount_uploader :video_url, VideoUploader

end
