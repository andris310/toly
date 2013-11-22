function readyProduct() {

  var selectDownloadable = $('#select-downloadable');

  $('#product_is_downloadable').change(function() {
    if ($('#product_is_downloadable option:selected').val() === 'true') {
      selectDownloadable.removeClass('hidden');
    } else {
      selectDownloadable.addClass('hidden');
    }
  });
}

$(document).ready(readyProduct);
$(document).on('page:load', readyProduct);