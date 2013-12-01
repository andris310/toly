
function readyCoupon() {

  $('#coupon_coupon_type').change(function() {
    console.log('change');
    if ($('#coupon_coupon_type option:selected').val() === 'Free PRODUCT') {
      $('#select-coupon-product').removeClass('hidden');
    }
  });
}


$(document).ready(readyCoupon);
$(document).on('page:load', readyCoupon);