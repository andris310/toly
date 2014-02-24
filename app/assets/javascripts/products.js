function readyProduct() {

  var selectDownloadable = $('#select-downloadable');
  var prodIsDownloadable = $('#product_is_downloadable');

  if (prodIsDownloadable.val() === 'true') {
    selectDownloadable.removeClass('hidden');
  }

  prodIsDownloadable.change(function() {
    if ($('#product_is_downloadable option:selected').val() === 'true') {
      selectDownloadable.removeClass('hidden');
    } else {
      selectDownloadable.addClass('hidden');
    }
  });
}

$(document).ready(readyProduct);
$(document).on('page:load', readyProduct);