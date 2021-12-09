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
	
	//파일업로드
	var fileTarget = $(".filebox .uploadHid");
	fileTarget.on("change", function(){
		if(window.FileReader){
			var filename = $(this)[0].files[0].name;
		}else{ // old IE
			var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
		}
		$(this).parents("dd").find(".preview .file span").append(filename);
		$(this).parents("dd").find(".preview").html("<p class='file'><span>"+ filename +"</span><a href='javascript:' class='del'>삭제</a></p>");
	});

	//파일삭제
	$(".preview").on("click", ".file .del", function(){
		var $input=$(".fileD .uploadHid");
		var $preview = $(".fileD .preview");
		resetInputFile($input, $preview);
	});
	
	//별점
	$(".click_score a").each(function(index){
		$(".click_score a").eq(index).on("click", function(){
			$(".click_score a").removeClass("check");
			for(var i=0; i<=index; i++){
				$(".click_score a").eq(i).addClass("check");				
			}
		});
	});

	//실시간예약
	$(".reserveDiv .accoD .accoBox .accoTit").each(function(index){
		$(this).on("click", function(){
			if($(this).parents(".accoBox").hasClass("on")){
				$(this).parents(".accoBox").removeClass("on");
				$(this).siblings(".accoCont").stop(true,true).slideUp(300);
			}else{
				$(this).parents(".accoBox").addClass("on");
				$(this).siblings(".accoCont").stop(true,true).slideDown(300);
				$(".reserveCont .tab a").eq(index).click();
			}

		});
	});
	
	$(".reserveCont .tab a").each(function(index){
		$(this).on("click", function(){
			if(!$(this).hasClass("on")){
				$(".reserveCont .tab a").removeClass("on");
				$(".reserveCont .tabCont > div").removeClass("on");
				$(this).addClass("on");
				$(".reserveCont .tabCont > div").eq(index).addClass("on");
			}

		});
	});

	//실시간예약 - 좌석
	$(".reserveCont .seatDiv .seat").each(function(index){
		$(this).on("click", function(){
			if(!$(this).hasClass("on")){
				$(".reserveCont .seatDiv .seat").removeClass("on");
				$(this).addClass("on");
			}
		});
		
		if($(".reserveCont .seatDiv .seat").eq(index).hasClass("no")){
			$(".reserveCont .seatDiv .seat").eq(index).off("click");
		}
	});

	//실시간예약 - 시간
	$(".reserveCont .rightFix .tabD .tabCont .scrollD a").each(function(index){
		$(this).on("click", function(){
			if($(this).hasClass("on")){
				$(this).removeClass("on");
			}else{
				$(this).addClass("on");
			}
		});

		if($(".reserveCont .rightFix .tabD .tabCont .scrollD a").eq(index).hasClass("no")){
			$(".reserveCont .rightFix .tabD .tabCont .scrollD a").eq(index).off("click");
		}
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


// 등록 이미지 삭제
function resetInputFile($input, $preview){
	var agent=navigator.userAgent.toLowerCase();
	console.log(agent);
	if((navigator.appName='Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ){
		//ie일때
		$input.replaceWith($input.clone(true));
		$preview.empty();
	}else{
		$input.val("");
		$preview.empty();
	}

}






