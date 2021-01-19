$(document).on("turbolinks:load", function () {
  $('#type-shinkyu').on('click', function () {
    $('#hide-text').slideDown();
  });

  $('#type-user').on('click', function () {
    $('#hide-text').slideUp();
  });

  $('#menu-btn').on('click', function () {
    $(this).toggleClass("on");
    if ($(this).hasClass("on")) {
      $(this).attr('src', '/assets/close.png');
      $("#menu-conts").slideDown();
    } else {
      $(this).attr('src', '/assets/open.png');
      $("#menu-conts").slideUp();
    }
  });

  $('#search-area').on('click', function () {
    $('#search-conts').slideToggle();
  });

});












