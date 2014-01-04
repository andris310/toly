class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  def spine_videos
    @products = Product.where("CAST(category AS text) = '1' OR CAST(category AS text) = '3'").order(:title)
  end

  def other_products
    @products = Product.where(:category => '2').order(:title)
  end
end
