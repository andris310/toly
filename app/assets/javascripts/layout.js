function mobileMenu() {
  $('#mobile-menu-button').click(function() {
    $('#mobile-menu').toggle('slide');
  });
}


$(document).ready(mobileMenu);
$(document).on('page:load', mobileMenu);