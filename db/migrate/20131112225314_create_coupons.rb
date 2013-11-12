class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :coupon_code
      t.integer :times_used

      t.timestamps
    end
  end
end
