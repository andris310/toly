function ready() {
  $('.add-to-cart-btn').on('click', function() {
    console.log('click');
    var cartId = $('#cart').attr('data-id');
    setTimeout(function() {
      $.ajax({
        url: '/count_items/' + cartId,
        method: 'get',
        dataType: 'json',
        success: function(result) {
          $('#cart-item-count').html(result)
        }
      });
    }, 200);
  });
}

$(document).ready(ready)
$(document).on('page:load', ready)