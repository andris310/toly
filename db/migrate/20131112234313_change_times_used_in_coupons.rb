class ChangeTimesUsedInCoupons < ActiveRecord::Migration
  def change
    change_column :coupons, :times_used, :integer, default: 0
  end
end
