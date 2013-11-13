class Order < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items

  belongs_to :user
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
  validates :first_name, :last_name, :email, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES

  validates_presence_of :address, :city, :state,
            :zipcode, :state, inclusion: STATES,
            :if => :downloadable_order?

  def downloadable_order?
    items = line_items.map { |i| Product.find_by(id: i.product_id)}
    !(items.all? { |i| i.is_downloadable })
  end

  def name
    first_name + ' ' + last_name
  end

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
