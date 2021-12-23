<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 -->
<style>
body {
    position: relative;
    font-family: "Montserrat", "Noto Sans KR", "맑은 고딕", "Malgun Gothic", sans-serif;
    font-size: 18px;
    font-weight: 300;
    color: #666;
    letter-spacing: -0.025em;
    line-height: 1;
    height: 100%;
    -webkit-text-size-adjust: 100%;
    -moz-text-size-adjust: 100%;
    -ms-text-size-adjust: 100%;
    -webkit-overflow-scrolling: touch;
}
div{
    margin: 0;
    padding: 0;
    display: block;
}
.subTit {
    padding: 200px 0 80px;
}

.page_title_area .title {
	padding-top: 246px;
	padding-bottom: 50px;
	font-family: 'NotoSansKR-Bold';
	font-size: 54px;
	color: #222;
	line-height: 100%;
}

.t_center {
	text-align: center;
}

#boardWrap {
	position: relative;
	margin: 0 auto;
	padding-bottom: 200px;
}

.notice_wrap {
	margin: 0 auto;
	margin-bottom: 40px;
	padding-top: 68px;
	width: 1200px;
}

.notice_table {
	table-layout: fixed;
	width: 100%;
	border-top: 2px solid #222;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
}

.hidden, .indent {
	overflow: hidden;
	width: 0;
	height: 0;
	font-size: 0;
	line-height: 0;
}

colgroup {
	display: table-column-group;
}

.notice_table .col1 {
	width: 130px;
	text-align: center;
}

thead {
	display: table-header-group;
	vertical-align: middle;
	border-color: inherit;
}

tr {
	display: table-row;
	vertical-align: inherit;
	border-color: inherit;
}

.notice_table thead th, .notice_table td.num {
	font-family: 'NotoSansKR-Medium';
	font-size: 16px;
	color: #222;
	text-align: center;
}

.notice_table thead th {
	height: 65px;
}

.notice_table th, .notice_table td {
	vertical-align: middle;
	border-bottom: 1px solid rgba(0, 0, 0, 0.2);
	letter-spacing: -0.025em;
}

th {
	display: table-cell;
	vertical-align: inherit;
	font-weight: bold;
	text-align: center;
}

.notice_table thead th, .notice_table td.num {
	font-family: 'NotoSansKR-Medium';
	font-size: 16px;
	color: #222;
}

.notice_table tbody td {
	height: 90px;
	font-family: 'NotoSansKR-Regular';
	font-size: 18px;
	color: #444;
}

.notice_table th, .notice_table td {
	vertical-align: middle;
	border-bottom: 1px solid rgba(0, 0, 0, 0.2);
	letter-spacing: -0.025em;
}

.t_center {
	text-align: center;
}

.notice_table span.label {
	display: inline-block;
	padding: 5px 10px;
	background: #001f2e;
	font-size: 14px;
	color: #fff;
}

.notice_table a {
	display: block;
	font-family: 'NotoSansKR-Light';
	font-size: 18px;
	line-height: 90px;
	margin: 0 50px 0 115px;
}

.ellipsis {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

a {
	font-size: inherit;
	color: inherit;
	text-decoration: none;
}

.notice_table td.date {
	font-family: 'NotoSansKR-Light';
	font-size: 14px;
	color: #666;
}

.notice_table tbody td {
	height: 90px;
	font-family: 'NotoSansKR-Regular';
	font-size: 18px;
	color: #444;
}

.notice_table th, .notice_table td {
	vertical-align: middle;
	border-bottom: 1px solid rgba(0, 0, 0, 0.2);
	letter-spacing: -0.025em;
}
</style>

<div class="subTit">
		<h2>공지사항</h2>
	</div>
<div id="content" class="sub_content">

	<div id="boardWrap">
		<div class="notice_wrap inner">
			<table class="notice_table">
				<caption class="indent">게시판 목록</caption>
				<colgroup>
					<col class="col1">
					<col class="col2">
					<col class="col3">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">등록일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="num t_center"><span class="label">NOTICE</span></td>
						<td><a href="/notice/notice_view.do" class="ellipsis">홈페이지 오픈</a></td>
						<td class="date t_center">2021.12.13</td>
					</tr>
					<tr>
						<td class="num t_center"><span class="label">NOTICE</span></td>
						<td><a href="/notice/notice_view.do" class="ellipsis">홈페이지 오픈 환영</a></td>
						<td class="date t_center">2021.12.13</td>
					</tr>
					<tr>
						<td class="num t_center"><span class="label">NOTICE</span></td>
						<td><a href="/notice/notice_view.do" class="ellipsis">홈페이지 오픈 기념 이벤트</a></td>
						<td class="date t_center">2021.12.13</td>
					</tr>
				</tbody>
			</table>
		</div>

		<div class="paging fs_def">
			<ul class="paging_ul fs_def"></ul>
		</div>

	</div>
</div>

<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>