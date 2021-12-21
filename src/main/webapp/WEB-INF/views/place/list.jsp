<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../header.jsp" %>

<!-- 본문시작 -->
	<div class="subTit bg" style="background-image:url('../images/place_img1.jpg')">
		<h2>${requestScope.store_name}</h2>
	</div>
	<div class="container placeRev">
		<div class="inner">
			<h3 class="subTit2">REVIEW</h3>
			<div class="reviewWrap">
				<div class="starP">
					<span class="star"></span>
					<p class="num"></p>
					<span class="txt">방문자 리뷰 </span>
					<span class="totnum">${fn:length(revlist)}</span>
				</div>
				<div class="reviewD">
					<c:forEach var="dto" items="${revlist}">
						<a href="placeview.do?store_name=${requestScope.store_name}&rev_number=${dto.rev_number}" class="revList">
							<p class="img">
								<c:if test="${dto.rev_image != ''}"><img src="../storage/${dto.rev_image}"></c:if>
							</p>
							<div class="txtD"> 
								<p class="revtit">${dto.rev_title}</p>
								<p class="info"><span class="mem">${dto.in_email}</span><span class="date">${dto.rev_date.substring(0,10)}</span></p>
								<p class="revstar">
									<c:choose>
										<c:when test="${dto.rev_score == 5}"><span class="star fiv"></span></c:when>
										<c:when test="${dto.rev_score == 4}"><span class="star for"></span></c:when>
										<c:when test="${dto.rev_score == 3}"><span class="star thr"></span></c:when>
										<c:when test="${dto.rev_score == 2}"><span class="star two"></span></c:when>
										<c:when test="${dto.rev_score == 1}"><span class="star one"></span></c:when>
										<c:otherwise><span class="star"></span></c:otherwise>
									</c:choose>
								</p>
								<div class="revCon">${dto.rev_content}</div>
							</div>
						</a>
					</c:forEach>
				</div>	
			</div>
			<div class="btnD">
				<a href="placewrite.do?store_no=${requestScope.store_no}&store_name=${requestScope.store_name}" class="btn"><span>리뷰쓰기</span></a>
			</div>
		</div>
	</div>
<!-- 본문끝 -->
<script>
	$(document).ready(function(){
		var scoreTot=0;
		var scoreAvg=0; 
		var revTot = 0;
		
		if(${fn:length(revlist)}!=0){
			revTot = parseInt(${fn:length(revlist)});
			<c:forEach var="dto" items="${revlist}">
				scoreTot += parseInt(${dto.rev_score});
			</c:forEach>
			
			$(".starP .num").html("<strong>"+(scoreTot/revTot).toFixed(1)+"</strong>/5");
		}else{
			$(".starP .num").html("<strong>0</strong>/5");
		}
		
		scoreAvg = Math.round(scoreTot/revTot);
		
		if(scoreAvg == 5){
			$(".reviewWrap .starP .star").addClass("fiv");	
		}else if(scoreAvg == 4){
			$(".reviewWrap .starP .star").addClass("for");
		}else if(scoreAvg == 3){
			$(".reviewWrap .starP .star").addClass("thr");
		}else if(scoreAvg == 2){
			$(".reviewWrap .starP .star").addClass("two");
		}else if(scoreAvg == 1){
			$(".reviewWrap .starP .star").addClass("one");
		}
		
	});	
	
	
</script>
<%@ include file="../footer.jsp" %>