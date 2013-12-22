class AddProductCategoryToProducts < ActiveRecord::Migration
  def change
    add_column :products, :category, :string
  end
end
