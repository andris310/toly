
function readyCoupon() {
  var selectCouponProduct = $('#select-coupon-product');
  var selectDiscountValue = $('#discount-value');

  $('#coupon_coupon_type').change(function() {
    var selectedValue = $('#coupon_coupon_type option:selected').val();

    if (selectedValue === 'Free PRODUCT') {
      selectCouponProduct.removeClass('hidden');
      selectDiscountValue.addClass('hidden');
    } else if (selectedValue === 'Order PERCENTAGE') {
      selectCouponProduct.addClass('hidden');
      selectDiscountValue.removeClass('hidden');
    } else {
      selectCouponProduct.addClass('hidden');
      selectDiscountValue.addClass('hidden');
    }
  });
}


$(document).ready(readyCoupon);
$(document).on('page:load', readyCoupon);