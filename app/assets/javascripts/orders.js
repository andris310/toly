function applyCoupon() {
  $('#apply-coupon').on('click', function() {
    console.log('apply click');
    var couponCode = $('#entered_code').val();
    $.ajax({
      url: '/apply-coupon',
      method: 'get',
      data: {entered_code: couponCode},
      dataType: 'json',
      success: function(result) {
        $('.order-discount').html('-$' + result.discount);
        $('.total_cell').html('$' + result.total);
      }
    });
  });
}


$(document).ready(applyCoupon);
$(document).on('page:load', applyCoupon);