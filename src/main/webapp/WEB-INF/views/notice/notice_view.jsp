<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 -->
<style>
.share_view {
	padding-top: 40px;
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
.share_view_cont .share_view_head .share_date{font-size:20px; color:#222;}
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
.share_view_cont .btnD{margin-top:80px;}
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
<div class="subTit">
	<h2>공지사항</h2>
</div>
<div class="share_view inner">
	<div class="share_view_cont">
		<div class="share_view_head t_center">
			<h4>${dto.n_title}</h4>
			<p class="share_date">${dto.n_date.substring(0,10)}</p>
		</div>
		<div class="share_view_body">
			<div class="share_view_body_txt">
				<p style="text-align: center">${dto.n_contents}</p>
			</div>
		</div>
		<div class="btnD">
			<a href="/notice/notice.do" class="btn"><span>목록</span></a>
			<a href="/notice/notice_write.do" class="btn"><span>글쓰기</span></a>
			<a href="/notice/notice_modify.do" class="btn"><span>수정</span></a>
		</div>
	</div>
</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>