<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 -->
<%
	String id="";
 if(session.getAttribute("uid")==null){
	 id="guest";
 }
 else{
	 id=session.getAttribute("uid").toString();
 }

%>

<div class="subTit">
	<h2>공지사항</h2>
</div>
<div class="share_view">
	<div class="share_view_cont inner">
		<%
		if (id.equals("admin")) {
		%>
		<div class="btnD type2 mt0">
			<a href="/notice/notice_modify.do?n_number=${dto.n_number}" class="btn"><span>수정</span></a>
			<a href="/notice/notice_delete.do?n_number=${dto.n_number}" class="btn del"><span>삭제</span></a>
		</div>
		<%
		}else{}
		%>		
		
		<div class="share_view_head t_center">
			<h4>${dto.n_title}</h4>
			<p class="share_date">${dto.n_date.substring(0,10)}</p>
		</div>
		<div class="share_view_body">
			<div class="share_view_body_txt">
				<p style="text-align: center">${dto.n_contents}</p>
			</div>
		</div>
		<!-- 2021-12-28 장지현 : 버튼 모양 통일하려고 마크업 수정했습니다! -->
		<div class="btnD">
			<a href="/notice/notice.do" class="btn"><span>목록</span></a>
			<%
			if (id.equals("admin")) {
			%>
			<a href="/notice/notice_write.do" class="btn"><span>글쓰기</span></a>
			<%}else{} %>
		</div>	
		<%-- <table>
		
			<th><a href="/notice/notice.do" class="share_btn">목록</a></th>
			<%
			if (id.equals("admin")) {
			%>
			
			<th><a href="/notice/notice_write.do" class="share_btn">글쓰기</a></th>
			<th><a href="/notice/notice_modify.do?n_number=${dto.n_number}" class="share_btn">수정</a></th>
			<th><a href="/notice/notice_delete.do?n_number=${dto.n_number}" class="share_btn">삭제</a></th>
			<%}else{} %>
			
		</table>
		 --%>
		<!-- // 2021-12-28 장지현 : 버튼 모양 통일하려고 마크업 수정했습니다! -->
	</div>
</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>