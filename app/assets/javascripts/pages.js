$(document).ready(function(){
  teacherQtip();
  $('.bxslider').bxSlider({
    mode: 'fade',
    controls: false,
    auto: true,
    pause: 4000
  });
});


function teacherQtip() {
  $('.contact-info').each(function() {
    var email = $(this).parent().data('email');
    $(this).qtip({
      content: '<a href="mailto:"' + email + '"target="_top" class="qtip_email">' + email + '</span></a></br><span>' + $(this).parent().data('phone') + '</span>',
      show: 'mouseover',
      hide: {
        fixed: true
      },
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

$(document).on('page:load', teacherQtip);