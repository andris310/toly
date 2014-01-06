
function mobileMenuSlide() {
  var mobileMenu = $('#mobile-menu');
  $('#mobile-menu-button').click(function() {
    mobileMenu.animate({
      'margin-left':'-2px'
    }, 200);
  });

  $('.close').click(function() {
    mobileMenu.animate({
      'margin-left': '-200px'
    }, 200);
  });
}


$(document).ready(mobileMenuSlide);
$(document).on('page:load', mobileMenuSlide);