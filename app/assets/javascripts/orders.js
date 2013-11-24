function applyCoupon() {
  $('#apply-coupon').on('click', function() {
    var couponCode = $('#entered_code').val();
    var couponValidity = $('.coupon-validity');
    $.ajax({
      url: '/apply-coupon',
      method: 'get',
      data: {entered_code: couponCode},
      dataType: 'json',
      success: function(result) {
        if (result.coupon === 'valid') {
          $('.order-discount').html('-$' + result.discount);
          $('.total_cell').html('$' + result.total);
          couponValidity.html('');
        } else {
          couponValidity.hide().html('Invalid coupon').fadeIn(400);
        }
      }
    });
  });
}


$(document).ready(applyCoupon);
$(document).on('page:load', applyCoupon);