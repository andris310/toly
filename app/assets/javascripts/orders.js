
function applyCoupon() {
  $('.billing-info').height($('.customer-info').height());
  $('#apply-coupon').on('click', function() {
    var couponCode = $('#entered_code').val();
    var couponValidity = $('.coupon-validity');
    var orderDiscount = $('.order-discount');
    var orderTotal = $('.total_cell');
    var discountText = $('.discount');
    var cardInfo = $('#card-info');
    $.ajax({
      url: '/apply-coupon',
      method: 'get',
      data: {entered_code: couponCode},
      dataType: 'json',
      success: function(result) {
        if (result.coupon === 'valid') {
          $('#order_entered_code').val(couponCode);
          discountText.show().html('Discount: ');
          orderDiscount.show().html('-$' + parseFloat(result.discount, 10).toFixed(2));
          orderTotal.html('$' + parseFloat(result.total, 10).toFixed(2));
          couponValidity.html(result.couponname).css({'color': 'green'});
          if (result.total === '0.0') {
            cardInfo.addClass('hidden');
          } else if (cardInfo.hasClass('hidden')) {
            cardInfo.removeClass('hidden');
          }
        } else {
          couponValidity.hide().html('Invalid coupon').css({'color': 'red'}).fadeIn(400);
          orderDiscount.html('-$' + parseFloat(result.discount, 10).toFixed(2));
          orderTotal.html('$' + parseFloat(result.total, 10).toFixed(2));
          discountText.hide();
          orderDiscount.hide();
          if (cardInfo.hasClass('hidden')){
            cardInfo.removeClass('hidden');
          }
        }
      }
    });
  });
}


$(document).ready(applyCoupon);
$(document).on('page:load', applyCoupon);