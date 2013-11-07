class AddIsDownloadableToProduct < ActiveRecord::Migration
  def change
    add_column :products, :is_downloadable, :boolean, :nil => false, :default => false
    add_column :products, :downloadable_file_size, :string
  end
end
