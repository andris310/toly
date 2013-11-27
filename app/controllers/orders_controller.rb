class OrdersController < ApplicationController
  include CurrentCart
  load_and_authorize_resource :except => [:new, :create, :order_finished]
  before_action :set_cart, only: [:new, :create, :apply_coupon]
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  def order_finished
    if user_signed_in?
      @order = current_user.orders.last
    end
  end

  # GET /orders/new
  def new
    if @cart.line_items.empty?
      redirect_to home_url, notice: 'Your cart is empty'
      return
    end

    if @cart.has_downloadable? and !user_signed_in?
      redirect_to new_user_session_url, notice: 'You must be logged in to purchase downloadable products'
      return
    end

    @order = Order.new
  end

  def apply_coupon
    discount = @cart.add_coupon(params[:entered_code])

    if discount > 0
      validity = 'valid'
    else
      validity = 'invalid'
    end
    cart_total = (@cart.total_price) - discount
    @totals = {
      coupon: validity,
      discount: discount,
      total: cart_total,
      }

    respond_to do |format|
      format.json { render :json => @totals }
    end
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(@cart)
    if user_signed_in?
      @order.user_id = current_user.id
    end
    discount = @cart.add_coupon(order_params[:entered_code])
    @order.discount = discount

    order_total = (@cart.total_price) - discount
    @order.total_price = order_total

    if !order_params[:entered_code].empty?
      @coupon = Coupon.find_by(:coupon_code => order_params[:entered_code])
      @order.coupon_id = @coupon.id
    end

    if order_total > 0
      process_order = @order.save_with_payment
    else
      process_order = @order.save
    end

    respond_to do |format|
      if process_order
        if @coupon
          @coupon.times_used += 1
          @coupon.save!
        end

        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        OrderNotifier.received(@order).deliver

        format.html { redirect_to '/order-finished', notice: "Thank You for your order of #{@order.list_products}", order: @order }
        format.json { render action: 'show', status: :created, location: @order }
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    @order = Order.find(params[:id])
    @order.attributes = params[:order]

    ship_date_changed = @order.ship_date_changed?

    respond_to do |format|
      if @order.save
        OrderNotifier.shipped(@order).deliver if ship_date_changed
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:first_name, :last_name, :address,
                                    :city, :state, :zipcode, :email,
                                    :pay_type, :user_id, :total_price,
                                    :stripe_card_token, :entered_code,
                                    :coupon_id, :shipped, :ship_date)
    end
end
