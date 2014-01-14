function videos() {
  // $('#generate-link').on('click', function(e) {
  //   $.ajax({
  //     url: '/create-download-link',
  //     method: 'get',
  //     data: {q: 'q'},
  //     dataType: 'json',
  //     success: function(result) {
  //       console.log('aaa');
  //     }
  //   });
  // });
}

$(document).ready(videos);
$(document).on('page:load', videos);