<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 -->
<div class="subTit">
	<h2>1:1 문의</h2>
</div>
<div class="container">
	<div class="inner">
		<div class="question">
			<h1>자주 묻는 질문</h1>
			<br>

			<div id="Accordion_wrap">
				<div class="que">
					<span>This is first question.</span>
				</div>
				<div class="anw">
					<span>This is first answer.</span>
				</div>
				<div class="que">
					<span>This is second question.</span>
				</div>
				<div class="anw">
					<span>This is second answer.</span>
				</div>
				<div class="que">
					<span>This is third question.</span>
				</div>
				<div class="anw">
					<span>This is third answer.</span>
				</div>
			</div>

			<div style="margin-bottom: 40px;"></div>
			<h1>문의하고자 하는 지점 선택</h1>
			<br>
			<hr>
			<br>
			<form action="#" class="select">
				<select name="place">
					<option value="">[홍대점]</option>
					<option value="">[강남점]</option>
					<option value="">[종각점]</option>
					<option value="">[명동점]</option>
				</select> <input type="submit" value="확인">
			</form>

			<div style="margin-bottom: 40px;"></div>
			<div class="btnD">
				<a href="#" class="btn"> <span>관리자와 채팅하기</span></a>
			</div>
		</div>
	</div>
</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>