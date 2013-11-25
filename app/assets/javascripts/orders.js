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
          $('#order_entered_code').val(couponCode);
          debugger;
          $('.order-discount').html('-$' + parseFloat(result.discount, 10).toFixed(2));
          $('.total_cell').html('$' + parseFloat(result.total, 10).toFixed(2));
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