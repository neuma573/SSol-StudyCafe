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
					<div class="img_wrap bg" style="background-image: url('../images/userImg.png')"></div>
					<div class="txt_wrap">
						<p class="name"><span>${dto.in_name}</span> 님</p>
						<p class="email">${dto.in_email}</p>
					</div>
				</div>
			</div>
	</div>
	<div class="mypage_center">
		<div class="layer_wrap on">
			<p class="mypage_ttl rel on">좌석 예약 내역</p>
			<div class="mypage_table">
				<table>
					<colgroup>
						<col width="*">
						<col width="*">
						<col width="*">
						<col width="*">
						<col width="206px">
					</colgroup>
					<tbody>
						<tr>
							<th>예약일자</th>
							<th>예약시간</th>
							<th>지점</th>
							<th>좌석번호</th>
							<th>진행상황</th>
						</tr>
						<tr>
							<td>${dto.res_date}</td>
							<td>${dto.times}</td>
							<td>${dto.store_no}</td>
							<td>${dto.seat_code}</td>
							<th>${dto.prog}</th>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="layer_wrap on">
			<p class="mypage_ttl rel on">사물함 예약 내역</p>
			<div class="mypage_table">
				<table>
					<colgroup>
						<col width="*">
						<col width="*">
						<col width="*">
						<col width="206px">
					</colgroup>
					<tbody>
						<tr>
							<th>사용시작일</th>
							<th>사용마감일</th>
							<th>지점</th>
							<th>사물함번호</th>
							<th>진행상황</th>
						</tr>
						<tr>
							<td>${dto.s_date}</td>
							<td>${dto.e_date}</td>
							<td>${dto.store_no}</td>
							<td>${dto.locker_code}</td>
							<td>${dto.prog}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="layer_wrap on">
			<p class="mypage_ttl rel on">보유 쿠폰</p>
			<div class="mypage_list">
				<ul>
					<li>
						<p class="coupon">보유하신 쿠폰이 없습니다.</p>
					</li>
				</ul>
			</div>
		</div>
	</div>
		</div>
</div>


<!-- 예약현황 end -->

<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>