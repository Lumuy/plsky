$(document).on('turbolinks:reload', function(){
  // header mobile menu click
  $('header .sh-mobile-ctrl').on('click', function(){
    $('header .sh-menu').toggleClass('showing');
  });
});
