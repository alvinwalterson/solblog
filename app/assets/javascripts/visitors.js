$(document).ready(function() {

  // To navigate between eat/play/stay section
  $("#location_blog_div").show();

  var update_status = function() {
    var $controller = $("#control-bar");
    var count = $controller.data('total');
    var current = $controller.data('current') + 1;

    if (current && count) {
      $("#featured-status").html("<h3>" + current.toString() + "/" + count.toString() + "</h3>")
    }
  };

  var show_current = function(current) {
    if (current == 0 || current) {
      $(".featured_image").removeClass("show").addClass("hidden");
      $(".featured_blog").removeClass("show").addClass("hidden");

      $("#featured-img-" + current.toString()).removeClass("hidden").addClass("show");
      $("#featured-blog-" + current.toString()).removeClass("hidden").addClass("show");
    }
  };

  update_status();

  $("#featured-left").on("click", function() {
    var $controller = $("#control-bar");
    var count = $controller.data('total');
    var current = $controller.data('current');

    current = (current - 1) % count;
    if (current < 0) current = current + count;

    show_current(current);

    $controller.data("current", current);

    update_status();
  });

  $("#featured-right").on("click", function() {
    var $controller = $("#control-bar");
    var count = $controller.data('total');
    var current = $controller.data('current');

    current = (current + 1) % count;

    show_current(current);

    $controller.data("current", current);

    update_status();
  });
 

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

    $titles.removeClass('hover_title');
    $(e.target).addClass('hover_title');

    var $target = $($(e.target).data("target"));
    $target.show();
    return false;
  });

  // Change banner and social media icons opacity
  $('.banner_img').on('mouseenter', function () {
    $(this).fadeTo('slow', 0.5);
  });

  $('.banner_img').on('mouseleave', function () {
    $(this).fadeTo('slow', 1);
  });

  $('.share_icon').on('mouseenter', function () {
    $(this).fadeTo('fast', 0.5);
  });

  $('.share_icon').on('mouseleave', function () {
    $(this).fadeTo('fast', 1);
  });

  // From here, image slider and nav bar for mobile device in small screen
  $('.bxslider').bxSlider({
    mode: 'fade',
    captions: true
  });

  if ($(window).width() <= 768) {
    $('#gallery_large').hide();
    $('#gallery_small').show();
    $('.menu_dot').hide();
  } else {
    $('#gallery_large').show();
    $('#gallery_small').hide();
    $('.menu_dot').show();
  }

  $(function() {
    $('#photo_viewer a').lightbox(); 
  });

  // image gallery big
  $('body').on('click', 'div.gv_galleryWrap div.gv_gallery div.gv_panelWrap div.gv_panel img', function() {
    var target = $('div.gv_filmstripWrap div.gv_filmstrip div.gv_frame div.current img').first().attr("target");
    location.href = target;
  });

  // image gallery mobile
  $('body').on('click', 'ul.bxslider li img', function() {
    var target = $(this).attr("data-target");
    location.href = target;
  });

});