<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!-- 본문시작 -->
	<div class="subTit bg" style="background-image:url('../images/place_img1.jpg')">
		<h2>${requestScope.store_name}</h2>
	</div>
	<div class="container">
		<div class="resultDiv inner">
			<p>${msg}</p>
			<div class="btnD bdT">
				<a href="placelist.do?store_no=${requestScope.store_no}&store_name=${requestScope.store_name}" class="btn"><span>목록</span></a>
			</div>
		</div>
	</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>