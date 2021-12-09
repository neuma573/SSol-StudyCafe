<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 -->
<div class="subTit">
	<h2>회원가입</h2>
</div>
<div class="container">
	<div class="join">
		<h3>간단한 회원 정보</h3>
		<br> <br>
		<textarea class="terms">제1조(목적)
이 약관은 SSOL.STUDYCAFE이 운영하는 홈페이지에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 SSOL.STUDYCAFE와 이용자의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.
※ 「PC통신 등을 이용하는 전자거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다」...
       </textarea>
		<br> 이용약관 동의(필수)<label><input type="checkbox"
			name="state" value="remain" checked></label><br> <br>
		<form action="#" method="post">
			<input type="text" placeholder="이름" required> 생년월일 <input
				type="date" class="email_join" value="1990-01-01" required>
			<input type="text" class="email_join" placeholder="휴대폰 번호" required>
			<button class="auth">인증</button>
			<br> <input type="submit" value="가입하기">
		</form>
	</div>
</div>
<br>
<br>
<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>