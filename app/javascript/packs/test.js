$(document).on("turbolinks:load", function () {
  $('#type-shinkyu').on('click', function () {
    $('#hide-text').show();
  });

  $('#type-user').on('click', function () {
    $('#hide-text').hide();
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
});












