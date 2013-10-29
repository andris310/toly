class Order < ActiveRecord::Base
  PAYMENT_TYPES = ["Credit card"]
  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES
end
