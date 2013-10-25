class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

  def item_total_price
    product.price * quantity
  end

end
