<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./header.jsp" %>
<!-- 본문시작 -->
	<div class="subTit">
		<h2>팝업가이드</h2>
	</div>
	<div class="container" style="text-align:center;">
		<a href="javascript:layerPop('popTest1');" style="display:block; margin:20px 0;font-size:20px;">팝업테스트1</a>
		<a href="javascript:layerPop('popTest2', '팝업테스트2 제목');" style="display:block; margin:20px 0;font-size:20px;">팝업테스트2</a>
		<a href="javascript:layerPop('popTest3', '팝업테스트3 제목, this값 전달 팝업', this);" style="display:block; font-size:20px;">팝업테스트3</a>
	</div>
	
	
	<div class="layerPop popTest1">
		<div class="popDiv">
			<p class="tit">팝업 테스트 제목입니다.</p>
			<div class="popCont">
				팝업 내용 팝업 내용 
			</div>
		</div>
		<a href="javascript:" class="xbtn">닫기</a>
	</div>
	
	<div class="layerPop popTest2">
		<div class="popDiv">
			<p class="tit"></p>
			<div class="popCont">
				팝업 내용 팝업 내용 
			</div>
		</div>
		<a href="javascript:" class="xbtn">닫기</a>
	</div>
	
	<div class="layerPop popTest2">
		<div class="popDiv">
			<p class="tit"></p>
			<div class="popCont">
				팝업 내용 팝업 내용 
			</div>
		</div>
		<a href="javascript:" class="xbtn">닫기</a>
	</div>
	
	<div class="layerPop popTest3">
		<div class="popDiv">
			<p class="tit"></p>
			<div class="popCont">
				팝업 내용 팝업 내용 
			</div>
		</div>
		<a href="javascript:" class="xbtn">닫기</a>
	</div>
<!-- 본문끝 -->
<%@ include file="./footer.jsp" %>