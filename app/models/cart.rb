class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  def add_product(product_id)
    current_item = line_items.find_by(product_id: product_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product_id)
    end
    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.item_total_price }
  end

  def items_in_cart

  end

  def is_downloadable?
    items = line_items.map { |i| Product.find_by(id: i.product_id)}
    items.all? { |i| i.is_downloadable }
  end

  def check_for_download
    check = false
    items = line_items.map { |i| Product.find_by(id: i.product_id)}
    items.map do |i|
      if i.is_downloadable
       check = true
      end
    end
    return check
  end

end
