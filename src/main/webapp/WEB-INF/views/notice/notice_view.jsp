<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 -->
<style>
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6,
	hr, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del,
	dfn, em, img, ins, kbd, q, s, samp, small, span, strike, strong, tt,
	var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label,
	legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside,
	canvas, details, embed, figure, figcaption, footer, header, hgroup,
	menu, nav, output, ruby, section, summary, time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-style: normal;
	font-variant: normal;
	font-weight: inherit;
	font-size: 100%;
	font-family: inherit;
	vertical-align: baseline;
	line-height: 100%;
}

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

.share_view_cont .share_btn {
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
<div class="share_view">
	<div class="share_view_cont">
		<div class="share_view_head t_center">
			<h4>홈페이지 오픈 안내</h4>
			<p class="share_date">2021.12.13</p>
		</div>
		<div class="share_view_body">
			<div class="share_view_body_txt">
				<p style="text-align: center">본문</p>
			</div>
		</div>
		<div class="share_view_foot"></div>
		<a href="/notice/notice.do" class="share_btn">목록</a>

	</div>
</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>