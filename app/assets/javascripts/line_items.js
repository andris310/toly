function ready() {
  $('.add-to-cart-btn').on('click', function() {
    var cartId = $('#cart').attr('data-id');
    setTimeout(function() {
      $.ajax({
        url: '/count_items/' + cartId,
        method: 'get',
        dataType: 'json',
        success: function(result) {
          $('#cart-item-count').html(result + (result === 1 ? ' item' : ' items'));
        }
      });
    }, 500);
  });
}

$(document).ready(ready);
$(document).on('page:load', ready);