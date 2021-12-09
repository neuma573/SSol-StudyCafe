$(document).ready(function() {
	//nav
	$('.navTrigger').click(function() {
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
		spaceBetween: 0,
		pagination: {
			el: ".swiper-pagination",
			clickable: true,
		},
		autoplay: true,
		speed: 900,
		observer: true,
		observeparents: true,
		on: {
			init: function() {
				$(".home .swiper-slide").eq(this.activeIndex).addClass("on");
			},
			slideChangeTransitionEnd: function() {
				$(".home .swiper-slide").removeClass("on");
				$(".home .swiper-slide").eq(this.activeIndex).addClass("on");
			}
		}
	});

	//팝업 닫기
	$(".layerPop .xbtn").on("click", function() {
		$(".dimmed").fadeOut(300);
		$(".layerPop").fadeOut(300);
	});

	//파일업로드
	var fileTarget = $(".filebox .uploadHid");
	fileTarget.on("change", function() {
		if (window.FileReader) {
			var filename = $(this)[0].files[0].name;
		} else { // old IE
			var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
		}
		$(this).parents("dd").find(".preview .file span").append(filename);
		$(this).parents("dd").find(".preview").html("<p class='file'><span>" + filename + "</span><a href='javascript:' class='del'>삭제</a></p>");
	});

	//파일삭제
	$(".preview").on("click", ".file .del", function() {
		var $input = $(".fileD .uploadHid");
		var $preview = $(".fileD .preview");
		resetInputFile($input, $preview);
	});

	//별점
	$(".click_score a").each(function(index) {
		$(".click_score a").eq(index).on("click", function() {
			$(".click_score a").removeClass("check");
			for (var i = 0; i <= index; i++) {
				$(".click_score a").eq(i).addClass("check");
			}
		});
	});

	//1:1 문의 자주묻는 질문 아코디언
	$(".que").on("click", function() {
		console.log("누름");
		$(this).next(".anw").stop().slideToggle(300);
		$(this).toggleClass('on').siblings().removeClass('on');
		$(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
	});


});

$(window).on('load', function() {
	if ($(".home").length == 0) {
		$(".nav").addClass("bk");
	} else {
		$(".nav").removeClass("bk");
	}

	/*if($(".subTit.bg").length != 0){
		  $(".nav").removeClass("bk");
	}else{
		  $(".nav").addClass("bk");
	}*/
});

// 팝업
function layerPop(popname, title, index) {
	$(".dimmed").fadeIn(300);
	$(".layerPop." + popname).fadeIn(300);
	if (title != null) {
		$(".layerPop." + popname).find(".tit").empty();
		$(".layerPop." + popname).find(".tit").append(title);
	}

	if ($(index).hasClass("review")) {
		var star = $(index).find(".star").clone();
		var num = $(index).find(".num").clone();
		$(".layerPop." + popname).find(".starP").empty();
		$(".layerPop." + popname).find(".starP").append(star);
		$(".layerPop." + popname).find(".starP").append(num);
	}
}


// 등록 이미지 삭제
function resetInputFile($input, $preview) {
	var agent = navigator.userAgent.toLowerCase();
	console.log(agent);
	if ((navigator.appName = 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1)) {
		//ie일때
		$input.replaceWith($input.clone(true));
		$preview.empty();
	} else {
		$input.val("");
		$preview.empty();
	}

}








