<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 -->
<div class="subTit">
	<h2>회원가입</h2>
</div>
<div class="container">
	<div class="join joinCont">
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
			onsubmit="return Check(mail_duCheck, mailnumCheck, pwckcorCheck, pwformCheck);">
			<input type="text" class="email_join" name="in_email" placeholder="이메일" required>
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

