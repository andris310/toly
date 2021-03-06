
function orders() {

  $('#apply-coupon').on('click', function() {
    var couponCode = $('#entered_code').val();
    var couponValidity = $('.coupon-validity');
    var orderDiscount = $('.order-discount');
    var orderTotal = $('.total_cell');
    var discountText = $('.discount');
    var cInfo = $('.customer-info');
    var cardInfo = $('.billing-info');
    var x = $('<div id="code-o"></div>');

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
            cInfo.append(x);
            cardInfo.addClass('hidden');
          } else if (cardInfo.hasClass('hidden')) {
            x.remove();
            cardInfo.removeClass('hidden');
          }

        } else {
          couponValidity.hide().html('Invalid coupon').css({'color': 'red'}).fadeIn(400);
          orderDiscount.html('-$' + parseFloat(result.discount, 10).toFixed(2));
          orderTotal.html('$' + parseFloat(result.total, 10).toFixed(2));
          discountText.hide();
          orderDiscount.hide();

          if (cardInfo.hasClass('hidden')){
            x.remove();
            cardInfo.removeClass('hidden');
          }
        }
      }
    });
  });

  $('#next-btn').on('click', function() {
    $(this).addClass('disabled');
  });

  $('#same_address').change(function() {

    if ($('#same_address').is(':checked')) {
      $('#billing_first_name').val($('#order_first_name').val());
      $('#billing_last_name').val($('#order_last_name').val());
      $('#billing_address').val($('#order_address').val());
      $('#billing_city').val($('#order_city').val());
      $('#billing_state').val($('#order_state').val());
      $('#billing_zipcode').val($('#order_zipcode').val());
      $('#billing_country_code').val($('#order_country_code').val());
    } else {
      $('#billing_first_name').val('');
      $('#billing_last_name').val('');
      $('#billing_address').val('');
      $('#billing_city').val('');
      $('#billing_state').val('');
      $('#billing_zipcode').val('');
      $('#billing_country_code').val('');
    }
  });

  var emailStatus = $('#spnEmailStatus');
  var phoneStatus = $('#spnPhoneStatus');
  var zipcodeStatus = $('#spnZipStatus');

  $('#order_email').bind('keyup blur', function(e) {
    if (validateEmail('order_email')) {
      emailStatus.html('Valid');
      emailStatus.css('color', '#6ECA6E');
    }
    else {
      emailStatus.html('Invalid Email');
      emailStatus.css('color', '#FF7000');
    }
  });

  $('#order_phone_nr').bind('keyup blur', function(e) {
    if (validatePhone('order_phone_nr')) {
      phoneStatus.html('Valid');
      phoneStatus.css('color', '#6ECA6E');
    }
    else {
      phoneStatus.html('Invalid format, enter (xxxxxxxxxx)');
      phoneStatus.css('color', '#FF7000');
    }
  });


  // $('#order_zipcode').bind('keyup blur', function(z) {
  //   if (validateZip('order_zipcode')) {
  //     zipcodeStatus.html('Valid');
  //     zipcodeStatus.css('color', '#6ECA6E');
  //   }
  //   else {
  //     zipcodeStatus.html('Invalid Zipcode');
  //     zipcodeStatus.css('color', '#FF7000');
  //   }
  // });

  function validateEmail(email) {
    var a = document.getElementById(email).value;
    var filter = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
    if (filter.test(a)) {
      return true;
    }
    else {
      return false;
    }
  }

  function validatePhone(phone) {
    var a = document.getElementById(phone).value;
    var filter = /^[2-9]\d{2}\d{3}\d{4}$/;
    if ((filter.test(a)) || (a === "")) {
      return true;
    }
    else {
      return false;
    }
  }


  // function validateZip(zipcode) {
  //   var zip = document.getElementById(zipcode).value;
  //   var filter = /^\d{5}(-\d{4})?$/;
  //   if (filter.test(zip)) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

} // end of order function

$(document).ready(orders);
$(document).on('page:load', orders);
