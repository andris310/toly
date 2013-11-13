class AddNameToCoupon < ActiveRecord::Migration
  def change
    add_column :coupons, :name, :string
    add_column :coupons, :coupon_type, :string
    add_column :coupons, :usage, :string
    add_column :coupons, :value, :integer
  end
end
