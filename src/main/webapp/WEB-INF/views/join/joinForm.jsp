<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 -->
<div class="subTit">
	<h2>회원가입</h2>
</div>
<div class="container">
	<div class="joinType">
		<a href="/join/join_detail.do?user=in">
			<img src="../images/individual.png"> 
			<span>개인회원</span>
		</a>
		<a href="/join/join_detail.do?user=en"> 
			<img src="../images/entrepreneur.png"> 
			<span>사업자 회원</span>
		</a> 
	</div>
</div>

<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>