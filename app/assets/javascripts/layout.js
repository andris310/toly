
function mobileMenuSlide() {
  var body = $('body').width();
  var cartBar = $('#cart-bar');
  var mobileMenu = $('#mobile-menu');

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
    cartBar.css({'right': (($(this).width() - body) / 2)});
  }

  $(window).resize(function(){

    if ($(this).width() > body) {
      cartBar.css({'right': (($(this).width() - body) / 2)});
    }
  });
}


$(document).ready(mobileMenuSlide);
$(document).on('page:load', mobileMenuSlide);