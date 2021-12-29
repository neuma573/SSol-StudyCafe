<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<div class="subTit">
	<h2>마이페이지</h2>
</div>
<div class="container">
	<div class="mypage_wrap">
		<div class="inner_1260">
			<div class="mypage_left">
				<div class="name_wrap">
					<div class="img_wrap bg"
						style="background-image: url('../images/userImg.png')"></div>
					<div class="txt_wrap">
						<p class="name">
							<span>사업자 ${userInfo.en_name}</span> 님
						</p>
						<p class="email">회원이메일</p>
					</div>
				</div>
			</div>
		</div>
		<div class="mypage_center">
			<div class="layer_wrap on">
				<p class="mypage_ttl rel on">보유 지점 정보</p>
				<div class="mypage_table">
					<table>
						<colgroup>
							<col width="*">
							<col width="*">
							<col width="*">
							<col width="*">
							<col width="*">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<th>지점명</th>
								<th>주소</th>
								<th>운영시간</th>
								<th>사업자번호</th>
								<th>전화번호</th>
								<th>채팅 문의</th>
							</tr>
							<%
							if (request.getAttribute("storelist") == null) {
							%>
							<tr>
								<td colspan="6">보유 지점이 없습니다.</td>
							</tr>
							<%
							} else {
							%>
							<c:forEach var="dto" items="${storelist}">
								<tr>

									<td>${dto.store_name}</td>
									<td>${dto.store_address}</td>
									<td>${dto.operating_hours}</td>
									<td>${dto.store_en_no}</td>
									<td>${dto.tel}</td>
									<td><a href="../chat/room?roomId=${dto.store_no}">
											문의확인</a></td>
								</tr>
							</c:forEach>
							<%
							}
							%>

						</tbody>
					</table>
				</div>
			</div>

			<div class="layer_wrap on">
				<p class="mypage_ttl rel on">이벤트 개최 정보</p>
				<div class="mypage_table">
					<table>
						<colgroup>
							<col width="*">
							<col width="*">
							<col width="*">
							<col width="*">
							<col width="*">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<th>이벤트명</th>
								<th>시작기간</th>
								<th>종료기간</th>
								<th>당첨자 수</th>
								<th>당첨 금액</th>
								<th>내용</th>
							</tr>
							<%
							if (request.getAttribute("eventlist") == null) {
							%>
							<tr>
								<td colspan="6">개최된 이벤트가 없습니다.</td>
							</tr>
							<%
							} else {
							%>
							<c:forEach var="dto" items="${eventlist}">
								<tr>
									<td>${dto.e_title}</td>
									<td>${dto.e_start}</td>
									<td>${dto.e_end}</td>
									<td>${dto.e_winners}</td>
									<td>${dto.e_money}</td>
									<td>${dto.e_content}</td>
									
								</tr>
							</c:forEach>
							<%
							}
							%>
						</tbody>
					</table>
				</div>
			</div>

			<div style="margin-bottom: 40px;"></div>
			<div class="btnD">
				<a href="mypage/place_add.do"><span id="" class="btn" onClick="">지점
						추가</span></a> <span id="" class="btn" onClick="">회원 탈퇴</span>
			</div>
			<div style="margin-bottom: 30px;"></div>
		</div>

	</div>
</div>


<!-- 예약현황 end -->

<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>