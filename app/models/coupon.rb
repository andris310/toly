class Coupon < ActiveRecord::Base
    belongs_to :product
  COUPON_TYPES = ['Free PRODUCT']
end

# 'Dollar amount OFF ENTIRE ORDER', 'Dollar amount off PRODUCT', 'Percent off PRODUCT', 'Percent off ENTIRE ORDER'