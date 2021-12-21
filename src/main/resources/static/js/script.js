
var mail_duCheck = false; //이메일 중복 확인
var pwckcorCheck = false; //비번 확인 일치 확인
var pwformCheck = false; //비번 형태 확인
var mailnumCheck = false; //이메일 인증번호 확인

$(document).ready(function() {
	//nav
	$('.navTrigger').click(function() {
		$(this).toggleClass('active');
		$("#mainListDiv").toggleClass("show_list");
		$("#mainListDiv").fadeIn();

	});

	$(window).scroll(function() {
		if($(document).scrollTop() > 50) {
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
			$("input#rev_score").val(i);
		});
	});


	//1:1 문의 자주묻는 질문 아코디언
	$(".que").on("click", function() {
		console.log("누름");
		$(this).next(".anw").stop().slideToggle(300);
		$(this).toggleClass('on').siblings().removeClass('on');
		$(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
	});

	//회원가입 
	if($(".joinCont").length != 0){
		mail_duCheck = false; //이메일 중복 확인
		pwckcorCheck = false; //비번 확인 일치 확인
		pwformCheck = false; //비번 형태 확인
		mailnumCheck = false; //이메일 인증번호 확인
		var code = "";
		$(".auth").click(function() {
			var email = $('.email_join').val();
			var checkBox = $(".mail_check_input"); // 인증번호 입력란
			var boxWrap = $(".mail_check_input_box"); // 인증번호 입력란 박스
			var checkResult = $("#mail_check_input_box_warn"); // 비교 결과 
			$.ajax({
				type: "GET",
				url: "../mail_du_Check?email=" + email,
				success: function(data) {
					console.log("data : " + data);
					mail_duCheck = data;

					if (mail_duCheck == "1") {
						checkResult.html("가입 가능한 이메일 입니다.");
						checkResult.attr("class", "correct");
						mail_duCheck = true;
						$.ajax({
							type: "GET",
							url: "../mailCheck?email=" + email,
							success: function(data) {
								console.log("data : " + data);
								checkBox.attr("disabled", false);
								boxWrap.attr("id", "mail_check_input_box_true");
								code = data;
							}
						});
					} else {
						checkResult.html("이미 가입된 이메일 입니다.");
						checkResult.attr("class", "incorrect");
						mail_duCheck = false;

					}

				}
			});

			console.log("mail_duCheck : " + mail_duCheck);

		});

		$(".pw_input").blur(function() { //비밀번호 유효성
			var pw = $('.pw_input').val();
			var num = pw.search(/[0-9]/g);
			var eng = pw.search(/[a-z]/ig);
			var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
			var checkResult = $("#pw_check_input_box_warn"); // 비교 결과 
			var pwck = $(".pwck_input"); // 비밀번호 확인 입력란
			//var boxWrap = $(".mail_check_input_box"); // 인증번호 입력란 박스
			pw = pw.trim();
			if (pw.length < 8 || pw.length > 20) {

				checkResult.html("8자리 ~ 20자리 이내로 입력해주세요.");
				checkResult.attr("class", "incorrect");
				pwformCheck = false;
			} else if (pw.search(/\s/) != -1) {

				checkResult.html("비밀번호는 공백 없이 입력해주세요.");
				checkResult.attr("class", "incorrect");
				pwformCheck = false;
			} else if (num < 0 || eng < 0 || spe < 0) {
				checkResult.html("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
				checkResult.attr("class", "incorrect");
				pwformCheck = false;
			} else {
				checkResult.html("사용 가능한 비밀번호 입니다.");
				checkResult.attr("class", "correct");
				pwck.attr("disabled", false);
				pwformCheck = true;
				//boxWrap.attr("id", "mail_check_input_box_true");

			}

			console.log("pwformCheck : " + pwformCheck);
		});

		//인증번호 비교 
		$(".mail_check_input").blur(function() {
			var inputCode = $(".mail_check_input").val(); // 입력코드    
			var checkResult = $("#mail_check_input_box_warn"); // 비교 결과 

			if (inputCode == code) { // 일치할 경우
				checkResult.html("인증번호가 일치합니다.");
				checkResult.attr("class", "correct");
				mailnumCheck = true;
			} else { // 일치하지 않을 경우
				checkResult.html("인증번호를 다시 확인해주세요.");
				checkResult.attr("class", "incorrect");
				mailnumCheck = false;
			}

		
			console.log("mailnumCheck : " + mailnumCheck);
		});

		$('.pwck_input').on("propertychange change keyup paste input", function() {
			var pw = $('.pw_input').val();
			var pwck = $('.pwck_input').val();
			if (pw == pwck) {
				$('.pwck_input_re_1').css('display', 'block');
				$('.pwck_input_re_2').css('display', 'none');
				pwckcorCheck = true;

			} else {
				$('.pwck_input_re_1').css('display', 'none');
				$('.pwck_input_re_2').css('display', 'block');
				pwckcorCheck = false;
			}
			
			console.log("pwckcorCheck : " + pwckcorCheck);
		});
		
	}// 회원가입 end 

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

// 돈 천단위마다 콤마(,)
function numberWithCommas(pay) { 
	return pay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 콤마 제거
function withoutCommas(pay) {
	return pay.toString().replace(",", '');
}

// 회원가입 
function Check(mail_duCheck, mailnumCheck, pwckcorCheck, pwformCheck) {
	console.log(mail_duCheck, mailnumCheck, pwckcorCheck, pwformCheck);
	if (mail_duCheck) {
		if (mailnumCheck && pwckcorCheck && pwformCheck) {
			alert("가입이 완료되었습니다.");
			return true;
		} else {
			alert("인증번호 또는 비밀번호가 틀렸습니다.");
			return false;
		}
	} else {
		alert("이미 가입된 이메일 입니다.");
		return false;
	}
	return false;
}


