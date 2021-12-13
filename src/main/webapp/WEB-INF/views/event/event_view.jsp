<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!-- 본문시작 -->
	<div class="subTit">
		<h2>이벤트</h2>
	</div>
	<div class="container eventRev">
		<div class="inner">
			<div class="btnD type2 mt0">
				<a href="/eventmodify.do" class="btn"><span>수정</span></a>
				<a href="javascript:" class="btn del"><span>삭제</span></a>
			</div>
			<div class="viewDiv">
				<p class="tit">이벤트 제목이 입력됩니다.</p>
				<div class="info">
					<p><span>작성자 ID</span> </p><p class="date"><span>작성일 :</span> 2021-12-06</p>
				</div>
				
				<div class="con">
					<p class="img"><img src="../images/event1.jpg" ></p>
					이벤트 내용				
				</div>
			</div>
			<div class="btnD">
				<a href="/event.do" class="btn"><span>목록</span></a>
			</div>
		</div><!-- // inner -->
	</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>