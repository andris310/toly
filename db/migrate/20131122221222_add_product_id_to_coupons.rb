class AddProductIdToCoupons < ActiveRecord::Migration
  def change
    add_reference :coupons, :product, index: true
  end
end
