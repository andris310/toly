class Order < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  PAYMENT_TYPES = ["Credit card"]
  STATES = [
      'AL', 'AK', 'AZ', 'AR', 'CA', 'CO', 'CT',
      'DE', 'DC', 'FL', 'GA', 'HI', 'ID', 'IL',
      'IN', 'IA', 'KS', 'KY', 'LA', 'ME', 'MD',
      'MA', 'MI', 'MN', 'MS', 'MO', 'MT', 'NE',
      'NV', 'NH', 'NJ', 'NM', 'NY', 'NC', 'ND',
      'OH', 'OK', 'OR', 'PA', 'PR', 'RI', 'SC',
      'SD', 'TN', 'TX', 'UT', 'VT', 'VA', 'WA',
      'WV', 'WI', 'WY'
    ]
  validates :first_name, :last_name, :address, :city, :state, :zipcode, :email, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES
  validates :state, inclusion: STATES

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

end
