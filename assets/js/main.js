(function ($) {
		$('.faq .question').click(function() {
			$(this).next().slideToggle(500);
		});
})(jQuery);
