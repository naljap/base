
$( document ).ready(function() {
	if(CURRENT_URL.indexOf('/admin/host/update/') > -1 || CURRENT_URL.indexOf('/host/SV') > -1) {
		$("#host_li").addClass("active");
		$("#host_ul").slideDown(function(){});
	} else if(CURRENT_URL.indexOf('/admin/strg/update/') > -1 || CURRENT_URL.indexOf('/strg/ST') > -1) {
		$("#strg_li").addClass("active");
		$("#strg_ul").slideDown(function(){});
	} else if(CURRENT_URL.indexOf('/admin/ntwk/update/') > -1 || CURRENT_URL.indexOf('/ntwk/') > -1) {
		$("#ntwk_li").addClass("active");
		$("#ntwk_ul").slideDown(function(){});
	}
	
/*
	if ($.cookie('menu_style') == "nav-sm") {
		$('body').removeClass("nav-md");
		$('body').addClass("nav-sm");
	} else {
		$('body').removeClass("nav-sm");
		$('body').addClass("nav-md");
	}
	$("#menu_toggle").click(function() {
		$.cookie('menu_style', $('body').attr('class'));
	});
*/
});
