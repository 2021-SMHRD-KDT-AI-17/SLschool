$(document).ready(function() {	
	$('#top_nav li').hover(function() {
		$('ul', this).stop().slideDown(200);
	}, function() {
		$('ul', this).slideUp(100);
	});
});

$(document).ready(function() {
    $("#m_navBtn").click(function(){
		m++;
		if(m%2 == 1){
			$("#m_navBtn").addClass("on");
			$("#navWrap").fadeIn(300).addClass("on");	
		}else{
			navClose(); 
		}; 
	});	
	$("#topmenuM .m_bmenu").click(function(){
		$('.m_smenu').not($(this).next()).slideUp(200);
		$('.m_bmenu').removeClass('on');
		$(this).addClass('on')
		$(this).next().slideDown(200);
	});	
	m = 0;  
	function navClose() { 
		$("#m_navBtn").removeClass("on");
		$("#navWrap").fadeOut(300).removeClass("on");	
	}
});