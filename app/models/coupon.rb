class Coupon < ActiveRecord::Base

  COUPON_TYPES = ['Free Download', 'Dollar amount OFF ENTIRE ORDER',
                  'Dollar amount off PRODUCT', 'Percent off PRODUCT',
                  'Percent off ENTIRE ORDER']
end
