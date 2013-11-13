class ChangeColumnNameInCoupons < ActiveRecord::Migration
  def change
    rename_column :coupons, :value, :discount_value
  end
end
