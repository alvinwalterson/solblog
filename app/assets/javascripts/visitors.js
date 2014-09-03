$(document).ready(function() {

  // To navigate between eat/play/stay section
  $("#location_blog_div").show();

  // To navigate top rated blogs in each destination page
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
 
  // Maintain submenu color when it is activated
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

  // Photo lightbox
  $(function() {
    $('#pinterest_photo div a').lightbox(); 
  });

  // image gallery link for desktop
  $('body').on('click', 'div.gv_galleryWrap div.gv_gallery div.gv_panelWrap div.gv_panel img', function() {
    var target = $('div.gv_filmstripWrap div.gv_filmstrip div.gv_frame div.current img').first().attr("target");
    location.href = target;
  });

  // image gallery link for mobile
  $('body').on('click', 'ul.bxslider li img', function() {
    var target = $(this).attr("data-target");
    location.href = target;
  });

  // Photo pinterest after loading all images
  imagesLoaded( $('#pinterest_photo'), function( instance ) {

    // Prepare layout options.
    var options = {
      align: 'center',
      autoResize: true, // This will auto-update the layout when the browser window is resized.
      container: $('#pinterest'), // Optional, used for some extra CSS styling
      offset: 10, // Optional, the distance between grid items
      itemWidth: '20%', // Optional, the width of a grid item
      flexibleWidth: true // Optional, "true" or "false", adjusts item width to create optimal layout based on browser size
    };

    // Get a reference to your grid items.
    var handler = $('#pinterest_photo div');

    // Call the layout function
    handler.wookmark(options);
  });

  // To show/hide Comments area
  $("#comment").click(function(){
    $("#comment_show").slideDown(1000);
    $("html, body").delay(1000).animate({
        scrollTop: $('#comment_input').offset().top 
    }, 300);    
  });

  $("#comment_hide").click(function(){
    $("#comment_show").slideUp(1000);
  });
});