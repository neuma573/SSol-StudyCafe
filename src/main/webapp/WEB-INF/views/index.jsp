<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>SSOL.STUDYCAFE</title>
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
	                    <li><a href="/login/login.do">로그인</a></li>
	                    <li><a href="/join/join.do">회원가입</a></li>
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
						<div class="swiper-slide"></div>
						<div class="swiper-slide"></div>
						<div class="swiper-slide"></div>
						<div class="swiper-slide"></div>
					</div>
					<div class="swiper-pagination"></div>
				</div>
			</section>
		</section><!-- //cont -->
	   	<div class="stk_btn">
			<a href="#" class="room_rsvt main_rsvt">
		    	<span class="rel">1:1 문의</span> <img src="../images/main_arrow.png" alt="" class="rel">
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