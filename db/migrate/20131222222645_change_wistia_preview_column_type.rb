class ChangeWistiaPreviewColumnType < ActiveRecord::Migration
  def change
    change_column :products, :wistia_preview, :text
  end
end
