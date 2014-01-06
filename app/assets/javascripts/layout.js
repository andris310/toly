
function mobileMenuSlide() {
  var mobileMenu = $('#mobile-menu');
  $('#mobile-menu-button').click(function() {
    mobileMenu.toggle('slide');
  });

  $('.close').click(function() {
    mobileMenu.toggle('slide');
  });
}


$(document).ready(mobileMenuSlide);
$(document).on('page:load', mobileMenuSlide);