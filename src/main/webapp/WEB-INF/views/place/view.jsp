<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!-- 본문시작 -->
	<div class="subTit">
		<h2>지점찾기</h2>
	</div>
	<div class="container">
		<div class="mapDiv">
			<div class="mapList">
				<form onsubmit="return mapSearchChk();">
					<div class="search">
						<input type="text" name="placeName" placeholder="매장명을 입력해주세요." >
						<input type="submit" class="btn">
					</div>
				</form>
				<p class="tot"><span>10개의 매장</span>이 검색되었습니다.</p>
				<div class="listD">
					<div class="list">
						<a href="javascript:">
							<p class="tit">매장명</p>
							<div class="txtD">
								<p class="addr">매장주소 매장주소 매장주소 </p>
								<p class="time">운영 시간 : 08:00-24:00</p>
								<p class="tel">전화번호 : 02-6956-3707</p>
							</div>
						</a>
						<a href="javascript:void(0)" class="review" onclick="layerPop('reviewPop', '매장명 리뷰', this); return false;">
							<span class="star for"></span><!-- class : one, two, thr, for, fiv -->
							<span class="num">(10)</span>
						</a>
					</div>
					<div class="list">
						<a href="javascript:">
							<p class="tit">매장명</p>
							<div class="txtD">
								<p class="addr">매장주소 매장주소 매장주소 </p>
								<p class="time">운영 시간 : 08:00-24:00</p>
								<p class="tel">전화번호 : 02-6956-3707</p>
							</div>
						</a>
						<a href="javascript:void(0)" class="review" onclick="layerPop('reviewPop', '매장명 리뷰', this); return false;">
							<span class="star thr"></span><!-- class : one, two, thr, for, fiv -->
							<span class="num">(10)</span>
						</a>
					</div>
					<div class="list">
						<a href="javascript:">
							<p class="tit">매장명</p>
							<div class="txtD">
								<p class="addr">매장주소 매장주소 매장주소 </p>
								<p class="time">운영 시간 : 08:00-24:00</p>
								<p class="tel">전화번호 : 02-6956-3707</p>
							</div>
						</a>
						<a href="javascript:void(0)" class="review" onclick="layerPop('reviewPop', '매장명 리뷰', this); return false;">
							<span class="star one"></span><!-- class : one, two, thr, for, fiv -->
							<span class="num">(10)</span>
						</a>
					</div>
					<div class="list">
						<a href="javascript:">
							<p class="tit">매장명</p>
							<div class="txtD">
								<p class="addr">매장주소 매장주소 매장주소 </p>
								<p class="time">운영 시간 : 08:00-24:00</p>
								<p class="tel">전화번호 : 02-6956-3707</p>
							</div>
						</a>
						<a href="javascript:void(0)" class="review" onclick="layerPop('reviewPop', '매장명 리뷰', this); return false;">
							<span class="star fiv"></span><!-- class : one, two, thr, for, fiv -->
							<span class="num">(10)</span>
						</a>
					</div>
					
				</div>
			</div>
			<div class="mapView"></div>
		</div>
	</div>
	<div class="layerPop reviewPop">
		<div class="popDiv">
			<p class="tit"></p>
			<p class="starP"></p>
			<div class="popCont">
				<div class="reviewD">
					<a href="javascript:" class="revList">
						<p class="img"><img src="../images/review_img1.jpg" /></p>
						<div class="txtD">
							<p class="revtit">리뷰 제목 </p>
							<p class="info"><span class="mem">작성자</span><span class="date">2021-12-06</span></p>
							<p class="revstar"><span class="star thr"></span></p>
							<div class="revCon">리뷰 내용 리뷰 내용 리뷰 내용 리뷰 내용 리뷰 내용 리뷰 내용리뷰 내용 리뷰 내용 리뷰 내용리뷰 내용 리뷰 내용 리뷰 내용리뷰 내용 리뷰 내용 리뷰 내용</div>
						</div>
					</a>
					<a href="javascript:" class="revList">
						<p class="img"></p>
						<div class="txtD">
							<p class="revtit">리뷰 제목 </p>
							<p class="info"><span class="mem">작성자</span><span class="date">2021-12-06</span></p>
							<p class="revstar"><span class="star thr"></span></p>
							<div class="revCon">리뷰 내용 리뷰 내용 리뷰 내용 리뷰</div>
						</div>
					</a>
					<a href="javascript:" class="revList">
						<p class="img"></p>
						<div class="txtD">
							<p class="revtit">리뷰 제목 </p>
							<p class="info"><span class="mem">작성자</span><span class="date">2021-12-06</span></p>
							<p class="revstar"><span class="star thr"></span></p>
							<div class="revCon">리뷰 내용 리뷰 내용 리뷰 내용 리뷰</div>
						</div>
					</a>
					<a href="javascript:" class="revList">
						<p class="img"></p>
						<div class="txtD">
							<p class="revtit">리뷰 제목 </p>
							<p class="info"><span class="mem">작성자</span><span class="date">2021-12-06</span></p>
							<p class="revstar"><span class="star thr"></span></p>
							<div class="revCon">리뷰 내용 리뷰 내용 리뷰</div>
						</div>
					</a>
				</div>
			</div>
		</div>
		<a href="javascript:" class="xbtn">닫기</a>
	</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>