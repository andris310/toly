function videos() {
  $('#generate-link').on('click', function(e) {
    e.preventDefault();
    var id = $('#video-id').html().trim();
    var exp = $('#expiration').val();
    $.ajax({
      url: '/create-download-link',
      method: 'get',
      data: {
        video_id: id,
        expiration: exp
      },
      dataType: 'json',
      success: function(res) {
        $('<p>' + res.url + '</p>').appendTo($('#generated-link'));
      }
    });
  });
}

$(document).ready(videos);