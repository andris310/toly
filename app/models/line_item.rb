class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  belongs_to :cart

  def item_total_price
    product.price * quantity
  end

  def item_shipping
    product.shipping * quantity
  end

end
