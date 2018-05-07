$(document).on('turbolinks:load', function(){
  // header mobile menu click
  $('header .sh-mobile-ctrl').on('click', function(){
    var tg = $('header .sh-menu')
    if(tg.css('display') == 'none') {
      tg.css('display', 'block');
    } else {
      tg.css('display', 'none');
    }
    // $('header .sh-menu ul').toggleClass('showing');
  });
});
