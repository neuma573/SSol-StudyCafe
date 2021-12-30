<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 -->


<div class="subTit">
	<h2>공지사항</h2>
</div>
<div class="share_view">
	<div class="share_view_cont inner">
		<c:if test="${uid == dto.en_email}">
			<div class="btnD type2 mt0">
				<a href="/notice/notice_modify.do?n_number=${dto.n_number}" class="btn"><span>수정</span></a>
				<a href="/notice/notice_delete.do?n_number=${dto.n_number}" class="btn del"><span>삭제</span></a>
			</div>
		</c:if>
		
		<div class="share_view_head t_center">
			<h4>${dto.n_title}</h4>
			<p class="share_date">${dto.n_date.substring(0,10)}</p>
		</div>
		<div class="share_view_body">
			<div class="share_view_body_txt">
				<p style="text-align: center">${dto.n_content}</p>
			</div>
		</div>
		<div class="btnD">
			<a href="/notice/notice.do" class="btn"><span>목록</span></a>
		</div>	
	</div>
</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>