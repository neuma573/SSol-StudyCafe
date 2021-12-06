<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>index.jsp</title>
	<meta content="width=device-width,user-scalable=no,maximum-scale=1.0,minimum-scale=1.0,target-densitydpi=medium-dpi,initial-scale=1.0" name="viewport"/>
	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
	<link rel="stylesheet" href="../css/style.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="../js/script.js"></script>
</head>
<body>
	<!-- partial:index.partial.html -->
	<div id="wrap">
		<nav class="nav">
	        <div class="container">
	            <div id="mainListDiv" class="main_list">
	                <ul class="navlinks">
	                    <li class="logo"><a href="#"><span>SSOL. STUDYCAFE</span></a></li>
	                    <li><a href="#">실시간예약</a></li>
	                    <li><a href="#">공지사항</a></li>
	                    <li><a href="#">이벤트</a></li>
	                    <li><a href="#">지점찾기</a></li>
	                    <li><a href="#">로그인</a></li>
	                    <li><a href="#">회원가입</a></li>
	                </ul>
	            </div>
	            <div class="logo mlogo"><a href="#">SSOL. STUDYCAFE</a></div>
	            <a href="javascript:" class="navTrigger">
	                <i></i>
	                <i></i>
	                <i></i>
	            </a>
	        </div>
	    </nav>
		
		<section id="container">
			<section class="home">
				<div class="swiper mySwiper">
					<div class="swiper-wrapper">
						<div class="swiper-slide vs1">
							<div class="txtD">
								<p class="tit">SSOL STUDYCAFE</p>
								<p class="txt">스터디 회의실 제공 <br>최적의 장소에서 업무 효율 극대화!</p>
							</div>
						</div>
						<div class="swiper-slide vs2">
							<div class="txtD">
								<p class="tit">SSOL STUDYCAFE</p>
								<p class="txt">여유있는 좌석 <br>같은 시간을 공부해도 더 효과적인 공간</p>
							</div>
						</div>
						<div class="swiper-slide vs3">
							<div class="txtD">
								<p class="tit">SSOL STUDYCAFE</p>
								<p class="txt">오직 공부만을 위해 만들어진 <br>프리미엄 스터디 공간!</p>
							</div>
						</div>
						<div class="swiper-slide vs4">
							<div class="txtD">
								<p class="tit">SSOL STUDYCAFE</p>
								<p class="txt">고객을 위한 편의시설 <br>고급 커피, 음료, 공용PC, 프린터가 모두 무료제공됩니다.</p>
							</div>
						</div>
					</div>
					<div class="swiper-pagination"></div>
				</div>
			</section>
		</section><!-- //cont -->
	   	<div class="stk_btn">
			<a href="#" class="room_rsvt main_rsvt">
		    	<span class="rel">1:1 채팅</span> <img src="../images/main_arrow.png" alt="" class="rel">
		    </a>
		    <a href="#" class="community_rsvt main_rsvt" >
		    	<span class="rel">창업 신청</span> <img src="../images/main_arrow.png" alt="" class="rel">
		    </a>
	    </div>
		<footer>
			<div class="container">
				<p>Copyright © STUDYCAFE All Rights Reserved</p>
			</div>
		</footer>
	</div>
</body>
</html>