<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 -->
<div class="subTit">
	<h2>회원가입</h2>
</div>
<div class="container">
<div class="join">
		<h3>개인회원 가입하기</h3>
		<br>
		<p>
			고객님의 소중한 정보를 반드시 확인 해 주세요.<br> ~~~~에 동의합니다.
		</p><label><input type="checkbox" name="state" value="remain" checked></label><br>
		<br>

		<form action="#" method="post">
			<input type="text" class="email_join" placeholder="이메일" required>
			<button class="auth">인증</button>
			<div>
				<img src="../images/certification_check.png"> 사용 가능한 이메일
			</div>
		</form>
		<form action="#" method="post">

			<input type="text" placeholder="인증번호" required>
			<div>
				<img src="../images/certification_check.png"> 인증완료
			</div>

			<div style="margin-bottom: 30px;"></div>
			<input type="password" placeholder="비밀번호 영문, 숫자, 특수문자 포함 8~34자"
				required> <input type="password" placeholder="비밀번호 확인"
				required>
			<div>
				<img src="../images/certification_check.png"> 확인완료
			</div>
			<input type="text" placeholder="이름" required> <input
				type="text" class="email_join" placeholder="생년월일" required>
			<button class="auth">캘린더</button>
			<input type="text" class="email_join" placeholder="휴대폰 번호" required>
			<button class="auth">인증</button>
			<br> <input type="submit" value="가입하기">
		</form>
	</div>
</div> <br><br>
<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>