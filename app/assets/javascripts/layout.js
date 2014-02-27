
function mobileMenuSlide() {
  var mobileMenu = $('#mobile-menu');
  var body = $('body').width();

  $('#mobile-menu-button').click(function() {
    mobileMenu.animate({
      'margin-left':'-2px'
    }, 200);
  });

  $('.close').click(function() {
    mobileMenu.animate({
      'margin-left': '-210px'
    }, 200);
  });

  if ($(this).width() > body) {
    $('#cart-bar').css({'right': (($(this).width() - body) / 2)});
  }

  $(window).resize(function(){

    if ($(this).width() > body) {
      $('#cart-bar').css({'right': (($(this).width() - body) / 2)});
    }
  });
}


$(document).ready(mobileMenuSlide);
$(document).on('page:load', mobileMenuSlide);