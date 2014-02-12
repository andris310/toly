function ready() {
  $('.add-to-cart-btn').on('click', function() {
    var cartId = $('#cart').attr('data-id');
    setTimeout(function() {
      $.ajax({
        url: '/count_items/' + cartId,
        method: 'get',
        dataType: 'json',
        success: function(result) {
          $('#cart-item-count span').html(result);
        }
      });
    }, 1000);
  });
}

$(document).ready(ready);
$(document).on('page:load', ready);