/*jslint browser: true*/
/*global $, jQuery, alert*/


/*============================================================
* Template Name    : Disha - Multipurpose One Page Html Template
* Author           : Vishal Lad
* Version          : 1.0
* Created          : 28/Apr/2020;
* File Description : Main JS file of the template documentation
===========================================================*/
  
/*----------------A Scroll Down Href--------------------*/
$(document).ready(function() {
	$('.menu li a').click(function(e) {

		var targetHref = $(this).attr('href');

		$('html, body').animate({
			scrollTop: $(targetHref).offset().top
		}, 1000);

		e.preventDefault();
	});
});

/*----------------Add Active Class In Menu Li--------------------*/
$(window).scroll(function() {
	var scrollDistance = $(window).scrollTop();

	$('.page-section').each(function(i) {
		if ($(this).position().top <= scrollDistance) {
			$('.menu li.active').removeClass('active');
			$('.menu li').eq(i).addClass('active');
		}
	});
}).scroll();