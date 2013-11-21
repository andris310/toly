function readyProduct() {
  $('#product_is_downloadable').change(function() {
    if ($('#product_is_downloadable option:selected').val() === 'true') {
      console.log('display videos');
    }
  });
}

$(document).ready(readyProduct)
$(document).on('page:load', readyProduct)