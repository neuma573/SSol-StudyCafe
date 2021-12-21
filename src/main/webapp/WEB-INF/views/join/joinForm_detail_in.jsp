<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 -->
<div class="subTit">
	<h2>회원가입</h2>
</div>
<div class="container">
	<div class="join">
		<h3>개인 회원 가입하기</h3>
		<br> <br>
		<textarea class="terms">제1조(목적)
이 약관은 SSOL.STUDYCAFE이 운영하는 홈페이지에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 SSOL.STUDYCAFE와 이용자의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.
※ 「PC통신 등을 이용하는 전자거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다」...
       </textarea>
		<p class="agree">
			이용약관 동의(필수)<label><input type="checkbox" name="state"
				value="remain" checked></label>
		<p>
		<form action="../join/join_detail_in.do" method="post"
			onsubmit="return Check(mail_duCheck, mailnumCheck, pwckcorCheck, pwformCheck)">
			<input type="text" class="email_join" name="in_email"
				placeholder="이메일" required>
			<button type="button" class="auth">인증</button>
			<div class="mail_check_input_box" id="mail check input box false">
				<input class="mail_check_input" disabled="disabled" type="text"
					placeholder="인증번호" required>
			</div>
			<div id="mail_check_input_box_warn"></div>


			<div style="margin-bottom: 30px;"></div>
			<input type="password" name="in_pw" class="pw_input"
				placeholder="비밀번호" required>
			<div id="pw_check_input_box_warn"></div>
			<input type="password" class="pwck_input" placeholder="비밀번호 확인"
				disabled="disabled" required>
			<div class="pwck_input_re_1">비밀번호가 일치합니다.</div>
			<div class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</div>
			<input type="text" placeholder="이름" name="in_name" required>
			생년월일 <input type="date" class="email_join" value="1990-01-01"
				name="in_birth" required> <br> <input type="submit"
				class="join_button" value="가입하기">
		</form>
	</div>
</div>
<br>
<br>
<br>
<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>
<script>
//회원가입
var mail_duCheck = false; //이메일 중복 확인
var pwckcorCheck = false; //비번 확인 일치 확인
var pwformCheck = false; //비번 형태 확인
var mailnumCheck = false; //이메일 인증번호 확인

var code = "";
$(".auth").click(function() {
	var email = $('.email_join').val();
	var checkBox = $(".mail_check_input"); // 인증번호 입력란
	var boxWrap = $(".mail_check_input_box"); // 인증번호 입력란 박스
	var checkResult = $("#mail_check_input_box_warn"); // 비교 결과 

	var email = $('.email_join').val();
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

});

//회원가입 최종
function Check(mail_duCheck, mailnumCheck, pwckcorCheck, pwformCheck) {
	console.log("????");
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

}

</script>