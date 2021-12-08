<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 -->
<div class="subTit">
	<h2>로그인</h2>
</div>
<div class="container">
<div class="form">
	<form  action="/" method="get">
	<br>
		<input type="text" class="email" name="email" placeholder="이메일" required><br> 
		<input type="password" class="pwd" name="pwd" placeholder="비밀번호" required><br> 
		 <label><input type="checkbox" name="state" value="remain" checked> 로그인 상태 유지</label><br>
		 <input type="submit" value="로그인">
	</form>

	<ul class="login_btn">
		<li><a href="#">아이디 찾기</a></li>
		<li><a href="#">비밀번호 재설정</a></li>
		<li><a href="/join/join.do">회원가입</a></li>
	</ul>

	<ul class="sns">
		<li><a href="#"><img src="../images/naver.png"></a></li>
		<li><a href="#"><img src="../images/kakao.png"></a></li>
		<li><a href="#"><img src="../images/facebook.png"></a></li>
		<li><a href="#"><img src="../images/google.png"></a></li>
	</ul>
</div>
</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>