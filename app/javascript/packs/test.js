$(function () {
  $('#type-shinkyu').click(function () {
    $('#hide-text').fadeIn();
  });

  $('#type-user').click(function () {
    $('#hide-text').fadeOut();
  });

  $('.open').click(function () {
    $('.header-nav__container').fadeIn(1000);
  });
  $('.open').click(function () {
    $('.close').show();
  });
  $('.open').click(function () {
    $(this).hide();
  });
  $('.close').click(function () {
    $('.header-nav__container').fadeOut(1000);
  });
  $('.close').click(function () {
    $('.open').show(1000);
  });
  $('.close').click(function () {
    $(this).hide();
  });





  // $('.open').on('click', '.open', function () {
  //   $(this).removeClass('.open').addClass('.close');
  // });
  // $('body').on('click', '.box2', function () {
  //   $(this).removeClass('box2').addClass('box3');
  // });







});

