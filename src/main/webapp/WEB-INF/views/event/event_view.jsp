<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 -->
<div class="subTit">
	<h2>이벤트</h2>
</div>
<div class="container eventV">
	<div class="inner">
		<div class="btnD type2 mt0">
			<a href="/eventmodify.do?e_number=${dto.e_number}" class="btn"><span>수정</span></a>
			<a href="javascript:" class="btn del"><span>삭제</span></a>
		</div>
		<div class="viewDiv">
			<p class="tit">${dto.e_title}</p>
			<div class="info">
				<p>
					<span>작성자 : </span>${dto.en_email}
				</p>
				<p>
					<span>작성일 : </span>${dto.e_start.substring(0,10)}~${dto.e_end.substring(0,10)}</p>
			</div>

			<div class="con">
					<p class="img"><c:if test="${dto.e_image != ''}"><img src="../storage/${dto.e_image}"></c:if></p>
					${dto.e_content}				
				</div>
		</div>
		<div class="btnD">
			<a href="javascript:history.back();" class="btn"><span>목록</span></a>
		</div>
	</div>
	<!-- // inner -->
</div>
<div class="layerPop delPop">
	<form name='eventdelFrm' id="eventdelFrm" method="post"
		action="/eventdelete.do"> 
		<input type="hidden" name="e_number" value="${dto.e_number}">
		<div class="popDiv">
			<p class="tit">리뷰 삭제</p>
			<div class="popCont">
				<p>
					리뷰를 삭제하시겠습니까? <br>관련 파일도 전체 삭제됩니다.
				</p>
				<div class="btnD">
					<a href="javascript:void(0)" class="btn"
						onclick="javascript:document.eventdelFrm.submit();"><span>삭제</span></a>
					<a href="javascript:" class="xbtn btn del"><span>취소</span></a>
				</div>
			</div>
		</div>
	</form>
	<a href="javascript:" class="xbtn">닫기</a>
</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>