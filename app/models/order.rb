class Order < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items

  attr_accessor :stripe_card_token

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
  # validates :pay_type, inclusion: PAYMENT_TYPES

  validates_presence_of :address, :city, :state,
            :zipcode, :state, inclusion: STATES,
            :if => :downloadable_order?

  def downloadable_order?
    items = line_items.map { |i| Product.find_by(id: i.product_id)}
    !(items.all? { |i| i.is_downloadable })
  end

  def has_downloadable?
    items = line_items.map { |i| Product.find_by(id: i.product_id)}
    items.any? { |i| i.is_downloadable }
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

  def list_products
    items = self.line_items.map do |i|
      i.quantity.to_s + ' x ' + Product.find_by(id: i.product_id).title
    end
    items * ', '
  end

  def save_with_payment
    begin
    if valid?
      customer = Stripe::Customer.create(
        :email => email,
        :card  => stripe_card_token,
        :description => self.name
      )
      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount => (self.total_price*100).to_i.to_s,
        :description => self.list_products,
        :currency => "usd")

      self.stripe_customer_token = charge.id
      save!
    end
      rescue Stripe::InvalidRequestError => e
        logger.error "Stripe error while creating customer: #{e.message}"
        errors.add :base, "There was a problem with your credit card. #{e.message}"
        false
      rescue Stripe::CardError => e
        errors.add :base, "There was a problem with your credit card. #{e.message}"
        false
    end
  end

end
