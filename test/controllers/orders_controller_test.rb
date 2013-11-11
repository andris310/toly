require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test 'should get new' do
    item = LineItem.new
    item.build_cart
    item.product = products(:ruby)
    item.save!
    session[:cart_id] = [item.cart.id]
    get :new
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count', +1) do
      post :create, order: {
        address: @order.address,
        city: @order.city,
        state: @order.state,
        zipcode: @order.zipcode,
        email: @order.email,
        first_name: @order.first_name,
        last_name: @order.last_name,
        pay_type: @order.pay_type }
    end

    assert_redirected_to store_path
  end

  test "should show order" do
    get :show, id: @order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order
    assert_response :success
  end

  test "should update order" do
    patch :update, id: @order, order: {
      address: @order.address,
      city: @order.city,
      state: @order.state,
      zipcode: @order.zipcode,
      email: @order.email,
      first_name: @order.first_name,
      last_name: @order.last_name,
      pay_type: @order.pay_type }
    assert_redirected_to order_path(assigns(:order))
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order
    end

    assert_redirected_to orders_path
  end

  test 'requires item in cart' do
    get :new
    assert_redirected_to store_path
    assert_equal flash[:notice], 'Your cart is empty'
  end

end
