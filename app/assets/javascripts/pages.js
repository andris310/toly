$(document).ready(function(){
  $('.bxslider').bxSlider({
    mode: 'fade',
    controls: false,
    auto: true,
    pause: 4000
  });
});

function teacherQtip() {
  $('.contact-teacher a').each(function() {
    $(this).qtip({
      content: $(this).parent().data('email'),
      show: 'mouseover',
      hide: 'mouseout',
      style: {
        classes: 'qtip-bootstrap'
      },
      position: {
         my: 'center left',
         at: 'center right'
     }
    });
  });
}

$(document).ready(teacherQtip);
$(document).on('page:load', teacherQtip);