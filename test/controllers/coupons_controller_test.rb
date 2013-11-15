require 'test_helper'

class CouponsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  setup do
    @coupon = coupons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:coupons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create coupon" do
    assert_difference('Coupon.count') do
      post :create, coupon: { coupon_code: @coupon.coupon_code,
                              times_used: @coupon.times_used,
                              name: @coupon.name,
                              coupon_type: @coupon.coupon_type,
                              usage: @coupon.usage,
                              discount_value: @coupon.discount_value }
    end

    assert_redirected_to coupon_path(assigns(:coupon))
  end

  test "should show coupon" do
    get :show, id: @coupon
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @coupon
    assert_response :success
  end

  test "should update coupon" do
    patch :update, id: @coupon, coupon: { coupon_code: @coupon.coupon_code,
                                          name: @coupon.name,
                                          coupon_type: @coupon.coupon_type,
                                          usage: @coupon.usage,
                                          discount_value: @coupon.discount_value }

    assert_redirected_to coupon_path(assigns(:coupon))
  end

  test "should destroy coupon" do
    assert_difference('Coupon.count', -1) do
      delete :destroy, id: @coupon
    end

    assert_redirected_to coupons_path
  end
end
