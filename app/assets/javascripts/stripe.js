(function() {
  var payment;

  jQuery(function() {
    Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'));
    return payment.setupForm();
  });

  payment = {
    setupForm: function() {
      return $('#new_order').submit(function() {
        $('input[type=submit]').attr('disabled', true);

        if ($('#code-o').is(':visible')) {
          return $('#new_order')[0].submit();
        } else if ($('#card_number').length) {
          payment.processCard();
          return false;
        } else {
          return true;
        }
      });
    },
    processCard: function() {
      var card;
      card = {
        name: $('#billing_first_name').val() + ' ' + $('#billing_last_name').val(),
        address_line1: $('#billing_address').val(),
        address_city: $('#billing_city').val(),
        address_state: $('#billing_state').val(),
        address_zip: $('#billing_zipcode').val(),
        address_country: $('#billing_country_code').val(),
        number: $('#card_number').val(),
        cvc: $('#card_code').val(),
        exp_month: $('#card_month').val(),
        exp_year: $('#card_year').val()
      };
      return Stripe.createToken(card, payment.handleStripeResponse);
    },
    handleStripeResponse: function(status, response) {
      if (status === 200) {
        $('#order_stripe_card_token').val(response.id);
        return $('#new_order')[0].submit();
      } else {
        $('#stripe_error').text(response.error.message).hide().fadeIn('fast');
        return $('input[type=submit]').attr('disabled', false).removeClass('disabled');
      }
    }
  };

}).call(this);
