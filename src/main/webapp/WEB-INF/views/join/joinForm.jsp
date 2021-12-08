<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 -->
<div class="subTit">
	<h2>회원가입</h2>
</div>
<div class="container">
	<div class="join">
		<br>
		<br>
		<br> <span> <img src="../images/individual.png"
			onclick="location.href='/join/join_detail.do?user=in'"> <span>개인
				회원</span>
		</span> <span> <img src="../images/entrepreneur.png"
			onclick="location.href='/join/join_detail.do?user=en'"> <span>사업자
				회원</span>
		</span> <br>
		<br>
	</div>
</div>

<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>