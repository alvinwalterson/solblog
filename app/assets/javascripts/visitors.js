$(document).ready(function() {

  // To navigate between eat/play/stay section
  $("#location_blog_div").show();
  $.each($(".submenu .submenu_title"), function(index, title) {
    var target = $($(title).data("target"));
    target.hide();
  });
  $(".submenu .submenu_title").on("click", function(e) {
    $("#location_blog_div").hide();
    var $titles = $(".submenu .submenu_title");

    $.each($titles, function(index, title) {
      var target = $($(title).data("target"));
      target.hide();
    });

    $titles.removeClass('highlight');
    $(e.target).addClass('highlight');

    var $target = $($(e.target).data("target"));
    $target.show();
    return false;
  });

  // Change banner opacity
  $("#banner_img").on('mouseenter', function () {
    $(this).fadeTo('slow', 0.5);
  });

  $("#banner_img").on('mouseleave', function () {
    $(this).fadeTo('slow', 1);
  });

  // Image slider for mobile device in small screen
  $('.bxslider').bxSlider({
    mode: 'fade',
    captions: true
  });

  if ($(window).width() <= 768) {
    $('#gallery_large').hide();
    $('#gallery_small').show();
  } else {
    $('#gallery_large').show();
    $('#gallery_small').hide();
  }
});