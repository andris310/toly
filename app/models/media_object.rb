class MediaObject < ActiveRecord::Base
  def download_url
    s3 = AWS::S3.new
    bucket = s3.buckets['the_name_of_your_bucket']
    object = bucket.objects[s3_key]
    object.url_for(:get, {
      expires: 10.minutes,
      response_content_disposition: 'attachment;'
    }).to_s
  end
end