class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  def index
    @products = Product.where(:category => '1').order(:title)
  end
end
