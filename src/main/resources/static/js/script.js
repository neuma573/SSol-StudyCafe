 $(document).ready(function(){
	//nav
	$('.navTrigger').click(function () {
	    $(this).toggleClass('active');
	    console.log("Clicked menu");
	    $("#mainListDiv").toggleClass("show_list");
	    $("#mainListDiv").fadeIn();
	
	});
	
	$(window).scroll(function() {
	    if ($(document).scrollTop() > 50) {
	        $('.nav').addClass('affix');
	        console.log("OK");
	    } else {
	        $('.nav').removeClass('affix');
	    }
	});
	
	var swiper = new Swiper(".mySwiper", {
    	pagination: {
      		el: ".swiper-pagination",
      		clickable: true,
    	},
    	autoplay:true,
    	speed:700
  	});
	 
 });
 
 $(window).on('load',function(){
	if($(".home").length != 0){
 		$(".nav").addClass("wh");
 	}else{
 		$(".nav").removeClass("wh");
 	}
});
