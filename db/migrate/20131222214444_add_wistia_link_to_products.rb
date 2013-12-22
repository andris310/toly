class AddWistiaLinkToProducts < ActiveRecord::Migration
  def change
    add_column :products, :wistia_preview, :string
  end
end
