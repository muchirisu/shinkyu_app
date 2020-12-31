$(function () {
  $('#type-shinkyu').on('click', function () {
    $('#hide-text').show();
  });

  $('#type-user').on('click', function () {
    $('#hide-text').hide();
  });

  // $('.open').on('click', function () {
  //   $('.header-nav__container').fadeIn(1000);
  //   $('.close').show();
  //   $(this).hide();
  // });

  // $('.close').on('click', function () {
  //   $('.header-nav__container').fadeOut(1000);
  //   $('.open').show(1000);
  //   $(this).hide();
  // });


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







  // $('.open').on('click', '.open', function () {
  //   $(this).removeClass('.open').addClass('.close');
  // });
  // $('body').on('click', '.box2', function () {
  //   $(this).removeClass('box2').addClass('box3');
  // });









