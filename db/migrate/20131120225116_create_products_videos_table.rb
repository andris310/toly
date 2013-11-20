class CreateProductsVideosTable < ActiveRecord::Migration
  def change
    create_table :products_videos_table, :id => false do |t|
      t.integer :product_id
      t.integer :video_id
    end
  end
end
