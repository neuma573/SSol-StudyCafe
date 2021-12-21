<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../header.jsp" %>
<!-- 본문시작 -->
	<div class="subTit bg" style="background-image:url('../images/place_img1.jpg')">
		<h2>${requestScope.store_name}</h2>
	</div>
	<div class="container placeRev"><!-- hidden 으로 매장코드 가져가기  -->
		<div class="inner">
			<div class="btnD type2 mt0"><!-- 작성자에게만 노출  -->
				<a href="/placemodify.do?store_name=${requestScope.store_name}&rev_number=${dto.rev_number}" class="btn"><span>수정</span></a>
				<a href="javascript:void(0);" class="btn del" onclick="layerPop('delPop'); return false;"><span>삭제</span></a>
			</div>
			<div class="viewDiv">
				<p class="tit">${dto.rev_title}</p>
				<div class="info">
					<p class="starP">
						<c:choose>
							<c:when test="${dto.rev_score == 5}"><span class="star fiv"></span></c:when>
							<c:when test="${dto.rev_score == 4}"><span class="star for"></span></c:when>
							<c:when test="${dto.rev_score == 3}"><span class="star thr"></span></c:when>
							<c:when test="${dto.rev_score == 2}"><span class="star two"></span></c:when>
							<c:when test="${dto.rev_score == 1}"><span class="star one"></span></c:when>
							<c:otherwise><span class="star"></span></c:otherwise>
						</c:choose>
					</p>
					<p><span>작성자 :</span> ${dto.in_email}</p><p class="date"><span>작성일 :</span> ${dto.rev_date.substring(0,10)}</p>
				</div>
				
				<div class="con">
					<p class="img"><c:if test="${dto.rev_image != ''}"><img src="../storage/${dto.rev_image}"></c:if></p>
					${dto.rev_content}				
				</div>
			</div><!-- //viewDiv  -->
			<div class="btnD">
				<a href="javascript:history.back();" class="btn"><span>목록</span></a>
			</div>
		</div><!-- // inner -->
	</div>
	
	<div class="layerPop delPop">
		<form name='placedelFrm' id="placedelFrm" method="post" action="/placedelete.do">
			<input type="hidden" name="store_name" value="${requestScope.store_name}">
			<input type="hidden" name="rev_number" value="${dto.rev_number}">
			<input type="hidden" name="store_no" value="${dto.store_no}">
			<div class="popDiv">
				<p class="tit">리뷰 삭제</p>
				<div class="popCont">
					<p>리뷰를 삭제하시겠습니까? <br>관련 파일도 전체 삭제됩니다.</p>
					<div class="btnD">
						<a href="javascript:void(0)" class="btn" onclick="javascript:document.placedelFrm.submit();"><span>삭제</span></a>
						<a href="javascript:" class="xbtn btn del"><span>취소</span></a>
					</div>				
				</div>
			</div>
		</form>
		<a href="javascript:" class="xbtn">닫기</a>
	</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>