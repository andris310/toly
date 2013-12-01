class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  has_one :coupon

  def add_product(product_id)
    current_item = line_items.find_by(product_id: product_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product_id)
    end
    current_item
  end

  def add_coupon(entered_code)
    coupons = Coupon.all
    coupons.each do |c|
      binding.pry
      if c.coupon_code == entered_code

        self.line_items.each do |item|
          if item.product_id == c.product_id
            return Product.find(item.product_id).price
          end
        end

        result = 0
      else
        result = 0
      end
    end
    result
  end

  def total_price
    line_items.to_a.sum { |item| item.item_total_price }
  end

  def items_in_cart
    line_items.to_a.sum { |item| item.quantity }.to_s
  end

  def is_downloadable?
    items = line_items.map { |i| Product.find_by(id: i.product_id)}
    items.all? { |i| i.is_downloadable }
  end

  def has_downloadable?
    items = line_items.map { |i| Product.find_by(id: i.product_id)}
    items.any? { |i| i.is_downloadable }
  end

end
