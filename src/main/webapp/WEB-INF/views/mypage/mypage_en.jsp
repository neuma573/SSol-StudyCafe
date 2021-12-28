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
							<span>${userInfo.en_name}</span> 님
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
						</colgroup>
						<tbody>
							<tr>
								<th>지점명</th>
								<th>주소</th>
								<th>운영시간</th>
								<th>사업자번호</th>
								<th>전화번호</th>
							</tr>
							<tr>
								<td colspan="5">보유 지점이 없습니다.</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<div class="layer_wrap on">
				<p class="mypage_ttl rel on">최근 예약 내역</p>
				<div class="mypage_table">
					<table>
						<colgroup>
							<col width="*">
							<col width="*">
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
								<th>사물함번호</th>
								<th>총금액</th>
								<th>진행상황</th>
							</tr>
							<tr>
								<td colspan="7">예약된 내용이 없습니다.</td>
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