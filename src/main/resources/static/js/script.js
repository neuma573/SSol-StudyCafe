$(document).ready(function() {
	//nav
	$('.navTrigger').click(function() {
		$(this).toggleClass('active');
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

	// 실시간예약 rightFix
	if ($(".reserveCont").length != 0) {
		var $leftF, $topF, $topF2;
		var $location, $store, $seat, $locker;
		var $pay;
		resFixed();

		//실시간예약
		$(".reserveDiv .accoD .accoBox .accoTit").each(function(index) {
			$(this).on("click", function() {
				setTimeout(function() {
					$leftF = ($(window).innerWidth() - $(".reserveCont .inner").width()) / 2 + $(".reserveCont .reserveDiv").width() + 15;
					$topF = $(".reserveCont .inner").offset().top - $(".nav").height();
					$topF2 = $(".resCheck").offset().top - 35;
					if ($(window).scrollTop() > $topF) {
						$(".reserveCont .rightFix").addClass("fixed");
						$(".reserveCont .rightFix").css({ top: $(".nav").height(), left: $leftF, bottom: "auto" });
					} else {
						$(".reserveCont .rightFix").removeClass("fixed");
						$(".reserveCont .rightFix").css({ top: "", left: "", bottom: "auto" });
					}
					if (($(window).scrollTop() + $(window).height()) >= $topF2) {
						$(".reserveCont .rightFix").removeClass("fixed");
						$(".reserveCont .rightFix").css({ top: "auto", left: "", bottom: 0 });
					}

					resFixed();
				}, 300);

				if ($(this).parents(".accoBox").hasClass("on")) {
					$(this).parents(".accoBox").removeClass("on");
					$(this).siblings(".accoCont").stop(true, true).slideUp(0);
				} else {
					$(this).parents(".accoBox").addClass("on");
					$(this).siblings(".accoCont").stop(true, true).slideDown(0);
					$(".reserveCont .tab a").eq(index).click();
				}

			});
		});

		$(".reserveCont .tab a").each(function(index) {
			$(this).on("click", function() {
				if (!$(this).hasClass("on")) {
					$(".reserveCont .tab a").removeClass("on");
					$(".reserveCont .tabCont > div").removeClass("on");
					$(this).addClass("on");
					$(".reserveCont .tabCont > div").eq(index).addClass("on");
				}

			});
		});

		//실시간예약 - 지역 select 
		$(".reserveCont select.location").change(function() {
			//초기화
			resReset();
			$(".reserveCont select.store").val("none").prop("selected", true);
			$(".reserveCont .slcDeTail .data").empty();
			$("form#pay_data input").attr("value", "");

			if ($(this).val() !== "none") {
				$location = $(this).val();
				$(".reserveCont .slcDeTail .location .data").empty();
				$(".reserveCont .slcDeTail .location .data").append($location);

				$("form#pay_data #location").attr("value", "");
				$("form#pay_data #location").attr("value", $location); //나중에 수정 
			}
		});

		//실시간예약 - 지점 select 
		$(".reserveCont select.store").change(function() {
			//초기화
			resReset();
			$(".reserveCont .slcDeTail p").not(".location").find(".data").empty();
			$("form#pay_data input").not("#location").attr("value", "");

			if ($(this).val() !== "none") {
				$store = $(this).val();
				$(".reserveCont .slcDeTail .store .data").empty();
				$(".reserveCont .slcDeTail .store .data").append($store);

				$("form#pay_data #store").attr("value", "");
				$("form#pay_data #store").attr("value", $store); //나중에 수정 
			}
		});

		//실시간예약 - 좌석
		$(".reserveCont .seatDiv .seat").each(function(index) {
			$(this).on("click", function() {
				if ($(".reserveCont select.location").val() == "none" || $(".reserveCont select.store").val() == "none") {
					alert("지역, 지점명을 선택해주세요!");
				} else {
					if (!$(this).hasClass("on")) {
						$seat = $(this).children("span").text();
						$(".reserveCont .seatDiv .seat").removeClass("on");
						$(this).addClass("on");

						//초기화
						$dayTxt = null;
						$timeArr = [];
						$(".reserveCont .rightFix .resTime .scrollD a").removeClass("on");
						$(".reserveCont .slcDeTail .total .pay").html("0"); //총 금액 0
						$(".reserveCont .slcDeTail p").not(".location").not(".store").find(".data").empty();
						$(".reserveCont .slcDeTail .seat .data").append($seat);
						$("form#pay_data #seat").attr("value", "");
						$("form#pay_data #seat").attr("value", $seat); //나중에 수정 

						// 좌석 선택 시 예약시간 노출
						if (!$(".reserveCont .rightFix .tabD .tab a").eq(0).hasClass("on")) {
							$(".reserveCont .rightFix .tabD .tab a").eq(0).click();
						}
						$(".reserveCont .rightFix .resTime .none").hide();
						$(".reserveCont .rightFix .resTime .scrollD").show();
					}
				}
			});

			if ($(".reserveCont .seatDiv .seat").eq(index).hasClass("no")) {
				$(".reserveCont .seatDiv .seat").eq(index).off("click");
			}
		});

		//실시간예약 - 사물함 
		$(".reserveCont .lockerD .locker").each(function(index) {
			$(this).on("click", function() {
				if ($(".reserveCont select.location").val() == "none" || $(".reserveCont select.store").val() == "none") {
					alert("지역, 지점명을 선택해주세요!");
				} else {
					if (!$(this).hasClass("on")) {
						$locker = $(this).children("span").text();
						$(".reserveCont .lockerD .locker").removeClass("on");
						$(this).addClass("on");

						//초기화
						$(".reserveCont .rightFix .resDay .scrollD a").removeClass("on");
						$(".reserveCont .slcDeTail .total .pay").html("0"); //총 금액 0
						$(".reserveCont .slcDeTail p").not(".location").not(".store").find(".data").empty();
						$(".reserveCont .slcDeTail .seat .data").html($locker);

						// 좌석 선택 시 예약시간 노출
						$(".reserveCont .rightFix .resDay .none").hide();
						$(".reserveCont .rightFix .resDay .scrollD").show();

						if (!$(".reserveCont .rightFix .tabD .tab a").eq(1).hasClass("on")) {
							$(".reserveCont .rightFix .tabD .tab a").eq(1).click();
						}
					}
				}
			});

			if ($(".reserveCont .lockerD .locker").eq(index).hasClass("no")) {
				$(".reserveCont .lockerD .locker").eq(index).off("click");
			}
		});

		//요금 =============================================================
		//실시간예약 - 좌석,룸 시간
		var $timeArr = [];
		var $timeIdx;
		var $totalPay = 0;
		$(".reserveCont .rightFix .resTime .scrollD a").each(function(index) {
			$(this).on("click", function() {
				var timeTxt = $(this).find("span").eq(1).text();
				if ($(this).hasClass("on")) {
					$(this).removeClass("on");
					$timeIdx = $timeArr.indexOf(timeTxt);
					$timeArr.splice($timeIdx, 1);
				} else {
					$(this).addClass("on");
					$timeArr.push(timeTxt);
				}

				if ($timeArr.length > 1) {
					$(".reserveCont .slcDeTail .time .data").html($timeArr[0] + " 외 " + ($timeArr.length - 1) + "건");
				} else if ($timeArr.length == 1) {
					$(".reserveCont .slcDeTail .time .data").html($timeArr[0]);
				} else if ($timeArr.length == 0) {
					$(".reserveCont .slcDeTail .time .data").empty();

				}

				if ($timeArr.length == 0) {
					$(".reserveCont .slcDeTail .total .pay").html("0");
				} else {
					if ($seat.indexOf("좌석") == 0) {
						//좌석
						$pay = 1500;
						if ($timeArr.length == 4) {
							$totalPay = 5000;
						} else if ($timeArr.length == 6) {
							$totalPay = 6000;
						} else if ($timeArr.length == 12) {
							$totalPay = 10000;
						} else if ($timeArr.length == 24) {
							$totalPay = 20000;
						} else {
							$totalPay = $pay * $timeArr.length;
						}
					} else {
						//ROOM
						$pay = 6000;
						if ($timeArr.length == 4) {
							$totalPay = 20000;
						} else if ($timeArr.length == 6) {
							$totalPay = 24000;
						} else if ($timeArr.length == 12) {
							$totalPay = 40000;
						} else if ($timeArr.length == 24) {
							$totalPay = 80000;
						} else {
							$totalPay = $pay * $timeArr.length;
						}
					}

					$(".reserveCont .slcDeTail .total .pay").html(numberWithCommas($totalPay));
				}

			}); //click

			if ($(".reserveCont .rightFix .resTime .scrollD a").eq(index).hasClass("no")) {
				$(".reserveCont .rightFix .resTime .scrollD a").eq(index).off("click");
			}
		});

		//실시간예약 - 사물함 날짜 
		var $dayTxt = null;
		$(".reserveCont .rightFix .resDay .scrollD a").each(function(index) {
			$(this).on("click", function() {
				if (!$(this).hasClass("on")) {
					$timeArr = [];
					$dayTxt = $(this).find("span").eq(1).text();
					$(".reserveCont .rightFix .resDay .scrollD a").removeClass("on");
					$(this).addClass("on");

					$(".reserveCont .slcDeTail .time .data").html($dayTxt);

					if ($dayTxt.indexOf("4주") == 0) {
						$pay = 9000;
					} else if ($dayTxt.indexOf("8주") == 0) {
						$pay = 16000;
					} else if ($dayTxt.indexOf("12주") == 0) {
						$pay = 24000;
					}
					$(".reserveCont .slcDeTail .total .pay").html(numberWithCommas($pay));
				}
			});

			if ($(".reserveCont .rightFix .resDay .scrollD a").eq(index).hasClass("no")) {
				$(".reserveCont .rightFix .resDay .scrollD a").eq(index).off("click");
			}
		});

		//예약추가 클릭 시 
		var $reserveDetail = [];
		$(".reserveCont .slcDeTail .resBtn").on("click", function() {
			if ($timeArr.length != 0 || $dayTxt != null) {
				//리셋
				resReset();
				$(".reserveCont .slcDeTail p").not(".location").not(".store").find(".data").empty();
				$(".reserveCont .resCheck .listD").empty();

				if ($timeArr.length != 0) { //좌석 시간 하나이상 선택 시 
					for (var i = $timeArr.length; i > 0; i--) {
						$reserveDetail.push(
							"<p class='location'>" + $location + "</p><p class='store'>" + $store + "</p><p class='seat'>"
							+ $seat + "</p><p class='date'>2021-12-09</p><p class='time'>" + $timeArr[i - 1] + "</p><p class='pay'>" + numberWithCommas($pay) + "원</p>"
						);
					}
				}

				if ($dayTxt != null) { // 사물함 날짜 선택 시 
					$reserveDetail.push(
						"<p class='location'>" + $location + "</p><p class='store'>" + $store + "</p><p class='seat'>"
						+ $locker + "</p><p class='date'>2021-12-09</p><p class='time'>" + $dayTxt + "</p><p class='pay'>" + numberWithCommas($pay) + "원</p>"
					);
				}

				for (var j = $reserveDetail.length; j > 0; j--) {
					$(".reserveCont .resCheck .listD").append(
						"<div class='list'><div><p class='num'>" + j + "</p>" + $reserveDetail[j - 1] + "</div><a href='javascript:' class='del'>삭제</a></div>"
					);
				}

			}
		});
	}

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

// 예약 리셋
function resReset() {
	$timeArr = [];
	$dayTxt = null;
	//$datArr=[];
	$(".reserveCont .seatDiv .seat").removeClass("on");
	$(".reserveCont .lockerD .locker").removeClass("on");
	$(".reserveCont .rightFix .resTime .scrollD a").removeClass("on");
	$(".reserveCont .rightFix .resDay .scrollD a").removeClass("on");
	$(".reserveCont .slcDeTail .total .pay").html("0");
	// 좌석 선택 시 예약시간 노출
	$(".reserveCont .rightFix .resTime .none").show();
	$(".reserveCont .rightFix .resDay .none").show();
	$(".reserveCont .rightFix .scrollD").hide();
}

// 실시간예약 fixed 
function resFixed() {
	$leftF = ($(window).innerWidth() - $(".reserveCont .inner").width()) / 2 + $(".reserveCont .reserveDiv").width() + 15;
	$topF = $(".reserveCont .inner").offset().top - $(".nav").height();
	$topF2 = $(".resCheck").offset().top - 35;
	$(window).scroll(function() {
		if ($(window).scrollTop() > $topF) {
			$(".reserveCont .rightFix").addClass("fixed");
			$(".reserveCont .rightFix").css({ top: $(".nav").height(), left: $leftF, bottom: "auto" });
		} else {
			$(".reserveCont .rightFix").removeClass("fixed");
			$(".reserveCont .rightFix").css({ top: "", left: "", bottom: "auto" });
		}

		if (($(window).scrollTop() + $(window).height()) >= $topF2) {
			$(".reserveCont .rightFix").removeClass("fixed");
			$(".reserveCont .rightFix").css({ top: "auto", left: "", bottom: 0 });
		}
	});

	// 실시간예약 - 탭 height 
	$(".reserveCont .rightFix .tabD .tabCont > div").height($(window).innerHeight() - $(".nav").height() - $(".reserveCont .rightFix .cal").height() - $(".reserveCont .rightFix .tabD .tab").height() - 10);
	$(".reserveCont .reserveDiv").css("min-height", $(".reserveCont .rightFix").outerHeight());
	$(window).resize(function() {
		$leftF = ($(window).innerWidth() - $(".reserveCont .inner").width()) / 2 + $(".reserveCont .reserveDiv").width() + 15;
		$topF = $(".reserveCont .inner").offset().top - $(".nav").height();
		$topF2 = $(".resCheck").offset().top - 35;
		$(".reserveCont .rightFix .tabD .tabCont > div").height($(window).innerHeight() - $(".nav").height() - $(".reserveCont .rightFix .cal").height() - $(".reserveCont .rightFix .tabD .tab").height() - 10);
		$(".reserveCont .reserveDiv").css("min-height", $(".reserveCont .rightFix").outerHeight());
	});

}

// 돈 천단위마다 콤마(,)
function numberWithCommas(pay) {
	return pay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 콤마 제거
function withoutCommas(pay) {
	return pay.toString().replace(",", '');
}







