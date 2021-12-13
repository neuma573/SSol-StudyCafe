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
			<div class="shDiv">
				<div class="shList">
					<form onsubmit="return mapSearchChk();">
						<div class="search">
						<p>
							<select class="situation">
								<option>전체</option>
								<option>진행중</option>
								<option>마감</option>
							</select> <input type="text" name="eventName" placeholder="검색어를 입력해주세요.">
							<input type="submit" class="btn">
						</div>
					</form>
				</div>
			</div>
			<div class="eventD">
				<a href="/eventview.do" class="eveList">
					<p class="img">
						<img src="../images/event1.jpg" />
					</p>
					<div class="event_cont">
						<div class="event_cont_top">
							<p class="event_name">이벤트 제목이 입력됩니다.</p>
						</div>
						<div class="event_cont_bot clearfix">
							<p class="event_date f_left">2021.10.01 ~ 2022.04.30</p>
							<div class="state f_right on">진행 중</div>
						</div>
					</div>

				</a> <a href="/eventview.do" class="eveList">
					<p class="img">
						<img src="../images/event1.jpg" />
					</p>
					<div class="event_cont">
						<div class="event_cont_top">
							<p class="event_name">이벤트 제목이 입력됩니다.</p>
						</div>
						<div class="event_cont_bot clearfix">
							<p class="event_date f_left">2021.10.01 ~ 2022.04.30</p>
							<div class="state f_right on">진행 중</div>
						</div>
					</div>

				</a> <a href="/eventview.do" class="eveList">
					<p class="img">
						<img src="../images/event1.jpg" />
					</p>
					<div class="event_cont">
						<div class="event_cont_top">
							<p class="event_name">이벤트 제목이 입력됩니다.</p>
						</div>
						<div class="event_cont_bot clearfix">
							<p class="event_date f_left">2020.10.01 ~ 2021.04.30</p>
							<div class="state f_right off">마감</div>
						</div>
					</div>

				</a>
				</a> <a href="/eventview.do" class="eveList">
					<p class="img">
						<img src="../images/event1.jpg" />
					</p>
					<div class="event_cont">
						<div class="event_cont_top">
							<p class="event_name">이벤트 제목이 입력됩니다.</p>
						</div>
						<div class="event_cont_bot clearfix">
							<p class="event_date f_left">2019.10.01 ~ 2020.04.30</p>
							<div class="state f_right off">마감</div>
						</div>
					</div>

				</a>
				<div class="btnD">
					<a href="/eventwrite.do" class="btn"><span>리뷰쓰기</span></a>
				</div>
			</div>
		</div>

	</div>
</div>

<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>