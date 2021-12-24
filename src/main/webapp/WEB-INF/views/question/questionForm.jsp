<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 -->
<div class="subTit">
	<h2>1:1 문의</h2>
</div>
<div class="container">
	<div class="inner">
		<div class="question">
			<h1>자주 묻는 질문</h1>
			<br>

			<div id="Accordion_wrap">
				<div class="que">
					<span>스터디룸 이용은 어떻게 하나요?</span>
				</div>
				<div class="anw">
					<span>스터디룸은 예약제로 운영됩니다. <br> [실시간 예약]-[매장 선택]에서 예약하시거나,
						매장에 문의 부탁드립니다.
					</span>
				</div>
				<div class="que">
					<span>이용 가격은 얼마인가요?</span>
				</div>
				<div class="anw">
					<span>직영점 기준으로 1시간 권 1,500원이며, <br>매장별로 금액이 상이할 수 있으니 각
						매장 카운터에 문의 바랍니다.
					</span>
				</div>
				<div class="que">
					<span>외부음식 반입불가/음식물 취식 가능 여부</span>
				</div>
				<div class="anw">
					<span>외부음식은 음료 포함 반입이 불가능하며, 필요 시 매장 카운터로 방문하여 주시기 바랍니다.</span>
				</div>
				<div class="que">
					<span>무료 대여 용품의 대여와 반납</span>
				</div>
				<div class="anw">
					<span>[c타입, 아이폰, 일반]충전기/담요/노트북 거치대/보드마카/HDMI대여 가능하며, <br>
						대여/반납 시 이용 카드 소지 후 카운터로 방문하시면 됩니다.
					</span>
				</div>
				<div class="que">
					<span>WIFI 이용방법</span>
				</div>
				<div class="anw">
					<span>ID ssolstudycafe/ p.w ssolstudycafe1 <br> 전 지점
						WIFI 이용 방법은 동일합니다.
					</span>
				</div>
				<div class="que">
					<span>파손 시 배상에 대한 책임</span>
				</div>
				<div class="anw">
					<span>실험이나 과제로 인한 기물 파손 시 배상 책임을 묻고 있으며, <br> 배상액은 파손
						정도에 따라 상이 할 수 있습니다.
					</span>
				</div>
			</div>

			<div style="margin-bottom: 40px;"></div>
			<h1>문의하고자 하는 지점 선택</h1>
			<br>
			<hr>
			<br>
			<div class="select">
				<select class="select" id="place" name="place">
					<c:forEach var="dto" items="${list}">
						<option value="${dto.store_no}">${dto.store_name}</option>
					</c:forEach>
				</select>
			</div>

			<div style="margin-bottom: 40px;"></div>
			<div class="btnD">
				<span id="chat" class="btn" onClick="chat_ch();">관리자와 채팅하기</span>
			</div>
			<div style="margin-bottom: 30px;"></div>
		</div>
	</div>
</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>

<script>
    function chat_ch(){ 
    	var store=$("#place").val();
         var uid = '<%=(String)session.getAttribute("uid")%>';

          if(uid=="null"){ 
             alert("로그인이 필요한 항목입니다."); 
             location.href="../login/login.do";
          }
          else{
        	  alert("store_no="+store); 
        	  
        	  /*
        	  $.ajax({
        	        type: "post", 
        	        url: "<%=request.getContextPath()%>/security/insert", 
        	        dataType: "json", 
        	        contentType : "application/x-www-form-urlencoded; charset=UTF-8",
        	        data: form
        	    });
        	  */
        	  
          }
    }   
</script>