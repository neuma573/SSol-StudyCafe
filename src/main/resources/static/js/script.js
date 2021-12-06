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
	    } else {
	        $('.nav').removeClass('affix');
	    }
	});
	
	// 메인 비주얼 
	var swiper = new Swiper(".mySwiper", {
		loop: true,
		spaceBetween:0,
    	pagination: {
      		el: ".swiper-pagination",
      		clickable: true,
    	},
    	autoplay:true,
    	speed:900,
    	observer:true,
        observeparents:true,
        on : {
        	init:function(){
        		$(".home .swiper-slide").eq(this.activeIndex).addClass("on");	
        	},
            slideChangeTransitionEnd : function(){
            	$(".home .swiper-slide").removeClass("on");
            	$(".home .swiper-slide").eq(this.activeIndex).addClass("on");
            }
        }
  	});

	//팝업 닫기
	$(".layerPop .xbtn").on("click", function(){
		$(".dimmed").fadeOut(300);
		$(".layerPop").fadeOut(300);
	});
	
	
 });
 
 $(window).on('load',function(){
	if($(".home").length == 0){
 		$(".nav").addClass("bk");
 	}else{
 		$(".nav").removeClass("bk");
 	}
});

// 팝업
function layerPop(popname, title, index){
	$(".dimmed").fadeIn(300);
	$(".layerPop."+popname).fadeIn(300);
	if(title != null){
		$(".layerPop."+popname).find(".tit").empty();
		$(".layerPop."+popname).find(".tit").append(title);
	}

	if($(index).hasClass("review")){
		var star=$(index).find(".star").clone();
		var num=$(index).find(".num").clone();
		$(".layerPop."+popname).find(".starP").empty();
		$(".layerPop."+popname).find(".starP").append(star);
		$(".layerPop."+popname).find(".starP").append(num);
	}
}


