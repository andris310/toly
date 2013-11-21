class Video < ActiveRecord::Base
  has_and_belongs_to_many :products
  validates :name, :description, presence: true
  validates :name, uniqueness: true

  mount_uploader :video_url, VideoUploader

end
