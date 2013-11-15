class AddImageProcessedToProducts < ActiveRecord::Migration
  def change
    add_column :products, :image_processed, :boolean
  end
end