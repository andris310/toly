
function readyCoupon() {
  var selectCouponProduct = $('#select-coupon-product');
  var selectedValue = $('#coupon_coupon_type option:selected').val();

  $('#coupon_coupon_type').change(function() {
    console.log('change');
    if (selectedValue === 'Free PRODUCT') {
      selectCouponProduct.removeClass('hidden');
    } else if (selectedValue === 'Order PERCENTAGE') {

    } else {
      selectCouponProduct.addClass('hidden');
    }
  });
}


$(document).ready(readyCoupon);
$(document).on('page:load', readyCoupon);