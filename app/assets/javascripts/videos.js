function videos() {
  $('#generate-link').on('click', function(e) {
    var id = $('#video-id').html().trim();
    $.ajax({
      url: '/create-download-link',
      method: 'get',
      data: {video_id: id},
      dataType: 'json',
      success: function(res) {
        $('<p>' + res.url + '</p>').appendTo($('#generated-link'));
      }
    });
  });
}

$(document).ready(videos);
$(document).on('page:load', videos);