class Coupon < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  belongs_to :order
  validates :name, :coupon_code, uniqueness: true
  validates :name, :coupon_code, :coupon_type, presence: true
  validates :coupon_code, length: { is: 8 }
  COUPON_TYPES = ['Free PRODUCT', 'Order PERCENTAGE']
end

# 'Dollar amount OFF ENTIRE ORDER', 'Dollar amount off PRODUCT', 'Percent off PRODUCT', 'Percent off ENTIRE ORDER'