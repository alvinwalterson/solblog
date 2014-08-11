$(document).ready(function() {
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

	$("#banner_img").on('mouseenter', function () {
	  $(this).fadeTo('slow', 0.5);
	});

	$("#banner_img").on('mouseleave', function () {
	  $(this).fadeTo('slow', 1);
	});

	$('.bxslider').bxSlider({
	  mode: 'fade',
	  captions: true
	});
});