<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!-- 본문시작 -->
	<div class="subTit bg" style="background-image:url('../images/place_img1.jpg')">
		<h2>종로직영점</h2>
	</div>
	<div class="container placeRev"><!-- hidden 으로 매장코드 가져가기  -->
		<div class="inner">
			<div class="btnD type2 mt0"><!-- 작성자에게만 노출  -->
				<a href="/placemodify.do" class="btn"><span>수정</span></a>
				<a href="javascript:" class="btn del"><span>삭제</span></a>
			</div>
			<div class="viewDiv">
				<p class="tit">리뷰 제목 입니다.</p>
				<div class="info">
					<p class="starP">
						<span class="star for"></span><!-- class : one, two, thr, for, fiv -->
					</p>
					<p><span>작성자 :</span> 리뷰232</p><p class="date"><span>작성일 :</span> 2021-12-06</p>
				</div>
				
				<div class="con">
					<p class="img"><img src="../images/review_img1.jpg" ></p>
					리뷰 내용입니다. 리뷰 내용입니다. 리뷰 내용입니다. 리뷰 내용입니다.				
				</div>
			</div><!-- //viewDiv  -->
			<div class="btnD">
				<a href="placelist.do" class="btn"><span>목록</span></a>
			</div>
		</div><!-- // inner -->
	</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>