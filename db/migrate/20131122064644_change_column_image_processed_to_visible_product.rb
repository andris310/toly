class ChangeColumnImageProcessedToVisibleProduct < ActiveRecord::Migration
  def change
    rename_column :products, :image_processed, :visible
  end
end
