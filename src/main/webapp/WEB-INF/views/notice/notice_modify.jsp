<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 -->
<
<style>
#boardWrap {
	max-width: none;
	width: auto;
}

.inquiry_wrap {
	padding-bottom: 128px;
}

.inquiry_form {
	position: relative;
	width: 1010px;
	box-sizing: border-box;
	margin: 0 auto;
}

input, select {
	margin: 0;
	padding: 0;
	font-style: normal;
	font-variant: normal;
	font-weight: inherit;
	font-size: 100%;
	font-family: inherit;
	line-height: 100%;
}

input, select, button, img {
	vertical-align: middle;
}

fieldset {
	display: block;
	margin-inline-start: 2px;
	margin-inline-end: 2px;
	padding-block-start: 0.35em;
	padding-inline-start: 0.75em;
	padding-inline-end: 0.75em;
	padding-block-end: 0.625em;
	min-inline-size: min-content;
	border-width: 2px;
	border-style: groove;
	border-color: threedface;
	border-image: initial;
}

.inquiry_table {
	width: 1000px;
	margin: 0 auto;
	table-layout: fixed;
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

.inquiry_table th {
	padding-left: 40px;
	border-right: 0;
	font-size: 17px;
	letter-spacing: -0.05em;
	color: #444;
	text-align: left;
	vertical-align: middle;
}

.inquiry_table th label, .inquiry_table th span {
	position: relative;
	font-family: 'NotoSansKR-Regular';
	color: #222;
}

.inquiry_table td {
	color: #444;
}

.inquiry_table td {
	padding: 7px 0;
}

.inquiry_table th.row_top {
	vertical-align: top;
	padding-top: 30px px;
}

.inquiry_table textarea {
	overflow: auto;
	width: 772px;
	height: 230px;
	padding: 20px;
	border: 1px solid #ececec;
	background: #fff;
	font-family: 'NotoSansKR-DemiLight';
	font-size: 16px;
	line-height: 160%;
	outline-style: none;
	resize: none;
	color: #000;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	-ms-box-sizing: border-box;
	box-sizing: border-box;
}

textarea {
	-webkit-writing-mode: horizontal-tb !important;
	font-style:;
	font-variant-ligatures:;
	font-variant-caps:;
	font-variant-numeric:;
	font-variant-east-asian:;
	font-weight:;
	font-stretch:;
	font-size:;
	font-family: monospace;
	text-rendering: auto;
	color: -internal-light-dark(black, white);
	letter-spacing: normal;
	word-spacing: normal;
	line-height: normal;
	text-transform: none;
	text-indent: 0px;
	text-shadow: none;
	display: inline-block;
	text-align: start;
	appearance: auto;
	-webkit-rtl-ordering: logical;
	resize: auto;
	cursor: text;
	white-space: pre-wrap;
	overflow-wrap: break-word;
	background-color: -internal-light-dark(rgb(255, 255, 255),
		rgb(59, 59, 59));
	column-count: initial !important;
	margin: 0em;
	border-width: 1px;
	border-style: solid;
	border-color: -internal-light-dark(rgb(118, 118, 118),
		rgb(133, 133, 133));
	border-image: initial;
	padding: 2px;
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

.inquiry_table input.w464, .inquiry_table select.w464 {
	width: 464px;
	font-size: 16px;
}
.inquiry_table input[type="text"], .inquiry_table input[type="password"], .inquiry_table select {
    width: 600px;
    height: 50px;
    padding: 0 20px;
    border: 1px solid #ececec;
    background: #fff;
    font-size: 16px;
    line-height: 35px;
    color: #000;
    outline-style: none;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    -ms-box-sizing: border-box;
    box-sizing: border-box;
}
</style>

<div class="subTit">
	<h2>공지사항</h2>
</div>
<div id="boardWrap">
	<div class="inquiry_wrap">
		<form name="inquiry_write" method="post"
			action="/board/index.php?type=action&amp;skin=root"
			enctype="multipart/form-data" accept-charset="UTF-8"
			class="inquiry_form">
			<fieldset class="iqr_info">
				<table summary="상담자 정보 입력사항" class="inquiry_table">
					<caption class="indent">상담자 정보 입력사항</caption>
					<colgroup>
						<col width="218px">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row"><label for="title">제목</label></th>
							<td><input type="text" class="w464" name="title"
								id="title" required="" autocomplete="off"></td>
						</tr>


						<tr class="cont">
							<th scope="row" class="v_top row_top"><label
								for="iqr_command_01">내용</label></th>
							<td><textarea name="content" id="content"
									required=""></textarea></td>
						</tr>
					</tbody>
				</table>
				<a href="/notice/notice.do" class="share_btn">제출</a>
			</fieldset>
		</form>
	</div>
</div>


<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>