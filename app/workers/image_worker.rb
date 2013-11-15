class ImageWorker
  include Sidekiq::Worker

  def perform(id, key)
    product = Product.find(id)
    product.key = key
    product.remote_image_url = product.image.direct_fog_url(with_path: true)
    product.save!
    product.update_column(:image_processed, true)
  end
end