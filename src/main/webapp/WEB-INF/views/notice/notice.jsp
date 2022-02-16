<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 -->

<div class="subTit">
	<h2>공지사항</h2>
</div>
<div class="container inquiry_wrap">
	<div id="boardWrap">
		<div class="notice_wrap inner">
			<div class="notice_table_div">
				<table class="notice_table">
					<caption class="indent">게시판 목록</caption>
					<colgroup>
						<col class="col1" width="100px">
						<col class="col2" width="*">
						<col class="col3" width="150px">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">제목</th>
							<th scope="col">등록일</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="dto" items="${noticeList}" varStatus="num">
						<tr>
							<td class="num t_center"><span class="label">${fn:length(noticeList) - (num.index)}</span></td>
							<td><a href="/notice/notice_view.do?n_number=${dto.n_number}" class="ellipsis">[${dto.store_name}] ${dto.n_title}</a></td>
							<td class="date t_center">${dto.n_date.substring(0,10)}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
			<c:if test="${user == 'en'}">
				<div class="btnD bdT">
					<a href="/notice/notice_write.do" class="btn"><span>등록</span></a>
				</div>
			</c:if>
		</div><!-- //notice_wrap -->
		
		<div class="paging fs_def">
			<ul class="paging_ul fs_def"></ul>
		</div>

	</div><!-- //borderwrap -->
</div><!-- //inquiry_wrap -->


<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>