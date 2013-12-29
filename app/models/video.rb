class Video < ActiveRecord::Base
  has_and_belongs_to_many :products
  validates :name, :description, presence: true
  validates :name, uniqueness: true

  mount_uploader :video_url, VideoUploader

  def video_name
    File.basename(video_url.path || video_url.filename) if video_url
  end

  def download_url
    s3 = AWS::S3.new
    bucket = s3.buckets['tolyvideos']
    object = bucket.objects[video_url.path]
    object.url_for(:get, {
      expires: 10.minutes,
      response_content_disposition: 'attachment;'
    }).to_s
  end

end
