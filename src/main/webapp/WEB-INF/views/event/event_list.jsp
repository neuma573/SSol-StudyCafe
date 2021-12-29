<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 -->
<div class="subTit">
	<h2>이벤트</h2>
</div>
<div class="container eventlis">
	<div class="inner">
		<div class="eventWrap">
			<ul class="tabmenu fs_def inner">
				<li class="on"><a href="#">전체</a></li>
				<li><a href="#">진행중</a></li>
				<li><a href="#">마감</a></li>
			</ul>
		</div>
		<div class="eventD">
			<c:forEach var="dto" items="${event_list}">
				<a href="/eventview.do?e_number=${dto.e_number}" class="eveList">
					<p class="img">
						<c:if test="${dto.e_image != ''}">
							<img src="../storage/${dto.e_image}">
						</c:if>
					</p>
					<div class="event_cont">
						<div class="event_cont_top">
							<p class="event_name">${dto.e_title}</p>
						</div>
						<div class="event_cont_bot clearfix">
							<p class="event_date f_left">${dto.e_start.substring(0,10)}~${dto.e_end.substring(0,10)}</p>
							<div class="state f_right on">진행중</div>
						</div>
					</div>
				</a>
			</c:forEach>
		</div>
		<div class="btnD">
			<a href="eventwrite.do" class="btn"><span>리뷰쓰기</span></a>
		</div>
	</div>
</div>

<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>