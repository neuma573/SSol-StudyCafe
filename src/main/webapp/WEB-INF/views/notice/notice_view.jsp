<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 -->
<style>
.share_view {
	padding-top: 68px;
}

.share_view_cont {
	width: 1200px;
	margin: 0 auto;
	padding-bottom: 200px;
}

.share_view_cont .share_view_head {
	position: relative;
	padding: 35px 80px;
	border-top: 2px solid #222;
	border-bottom: 1px solid #ccc;
}

.t_center {
	text-align: center;
}

.share_view_cont .share_view_head h4 {
	margin-bottom: 30px;
	font-family: 'NotoSansKR-Medium';
	font-size: 26px;
	line-height: 120%;
	color: #222;
}

.share_view_cont .share_view_body {
	padding: 46.5px 50px 50px 50px;
	border-bottom: 1px solid #ccc;
}

.share_view_cont .share_view_body_txt {
	font-size: 18px;
	line-height: 194.4444%;
	letter-spacing: -0.025em;
	color: #666;
}

.share_btn {
	display: block;
	margin: 45px auto 0;
	width: 200px;
	height: 70px;
	font-family: 'NEXONLv1GothicBold';
	font-size: 20px;
	color: #fff;
	line-height: 70px;
	text-align: center;
	background: #001f2e;
}
</style>
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
	<div class="share_view_cont">
		<div class="share_view_head t_center">
			<h4>${dto.n_title}</h4>
			<p class="share_date">${dto.n_date}</p>
		</div>
		<div class="share_view_body">
			<div class="share_view_body_txt">
				<p style="text-align: center">${dto.n_contents}</p>
			</div>
		</div>
		<table>
			<th><a href="/notice/notice.do" class="share_btn">목록</a></th>
									<%
						if (id.equals("admin")) {
						%>
			<th><a href="/notice/notice_write.do" class="share_btn">글쓰기</a></th>
			<th><a href="/notice/notice_modify.do?n_number=${dto.n_number}" class="share_btn">수정</a></th>
			<th><a href="/notice/notice_delete.do?n_number=${dto.n_number}" class="share_btn">삭제</a></th>
			<%}else{} %>
			
		</table>
	</div>
</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>