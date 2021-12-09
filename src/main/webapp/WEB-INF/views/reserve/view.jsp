<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!-- 본문시작 -->
	<div class="subTit">
		<h2>실시간예약</h2>
	</div>
	<div class="container reserveCont">
		<div class="inner">
			<div class="reserveDiv">
				<div class="slcD">
					<div class="nameSlc">
						<span>지역</span>
						<select class="location">
							<option>지역을 선택해주세요</option>
							<option>서울</option>
							<option>인천</option>
							<option>경기</option>
							<option>부산</option>
							<option>대구</option>
						</select>
					</div>	
					<div class="nameSlc">
						<span>지점명</span>
						<select class="store">
							<option>지점을 선택해주세요</option>
							<option>노원직영점</option>
							<option>강남직영점</option>
							<option>천호점</option>
							<option>사당역점</option>
							<option>공릉점</option>
						</select>
					</div>	
				</div><!-- //slcD -->
				<div class="accoD">
					<div class="accoBox on">
						<a href="javascript:" class="accoTit">좌석 선택하기</a>
						<div class="accoCont" style="display:block;">
							<div class="seatInfo">
								<span>선택가능</span>
								<span>선택함</span>
								<span>선택불가</span>
							</div>
							<div class="seatDiv">
								<div class="deskD">
									<a href="javascript:" class="desk seat"><span>좌석1</span></a>
									<a href="javascript:" class="desk no"><span>좌석2</span></a><!-- 클래스 no 붙으면 선택 불가 -->
									<a href="javascript:" class="desk seat"><span>좌석3</span></a>
									<a href="javascript:" class="desk seat"><span>좌석4</span></a>
									<a href="javascript:" class="desk seat"><span>좌석5</span></a>
									<a href="javascript:" class="desk seat"><span>좌석6</span></a>
									<a href="javascript:" class="desk seat"><span>좌석7</span></a>
									<a href="javascript:" class="desk seat"><span>좌석8</span></a>
									<a href="javascript:" class="desk seat"><span>좌석9</span></a>
									<a href="javascript:" class="desk seat"><span>좌석10</span></a>
									<a href="javascript:" class="desk seat"><span>좌석11</span></a>
									<a href="javascript:" class="desk seat"><span>좌석12</span></a>
									<a href="javascript:" class="desk seat"><span>좌석13</span></a>
									<a href="javascript:" class="desk seat"><span>좌석14</span></a>
									<a href="javascript:" class="desk seat"><span>좌석15</span></a>
									<a href="javascript:" class="desk seat"><span>좌석16</span></a>
									<a href="javascript:" class="desk seat"><span>좌석17</span></a>
									<a href="javascript:" class="desk seat"><span>좌석18</span></a>
									<a href="javascript:" class="desk seat"><span>좌석19</span></a>
									<a href="javascript:" class="desk seat"><span>좌석20</span></a>
									<a href="javascript:" class="desk seat"><span>좌석21</span></a>
									<a href="javascript:" class="desk seat"><span>좌석22</span></a>
									<a href="javascript:" class="desk seat"><span>좌석23</span></a>
									
									<a href="javascript:" class="desk seat"><span>좌석24</span></a>
									<a href="javascript:" class="desk seat"><span>좌석25</span></a>
									<a href="javascript:" class="desk seat"><span>좌석26</span></a>
									<a href="javascript:" class="desk seat"><span>좌석27</span></a>
									<a href="javascript:" class="desk seat"><span>좌석28</span></a>
									<a href="javascript:" class="desk seat"><span>좌석29</span></a>
									<a href="javascript:" class="desk seat"><span>좌석30</span></a>
									<a href="javascript:" class="desk seat"><span>좌석31</span></a>
								</div>
								<div class="roomD">
									<a href="javascript:" class="room seat no"><span>ROOM1</span></a>
									<a href="javascript:" class="room seat"><span>ROOM2</span></a>
									<a href="javascript:" class="room seat"><span>ROOM3</span></a>
									<a href="javascript:" class="room seat"><span>ROOM4</span></a>
								</div>
								<div class="lockerLine">사물함</div>
							</div><!-- //seatDiv -->
						</div><!-- //accoCont -->
					</div>
					<div class="accoBox">
						<a href="javascript:" class="accoTit">사물함 선택하기</a>
						<div class="accoCont">
							
						</div>
					</div>
				</div><!-- //accoD -->
				<form id="pay_data">
                    <input type="hidden" name="location" id="location" value=""><!-- 지역 -->
                    <input type="hidden" name="store" id="store" value=""><!-- 지점 -->
                    <input type="hidden" name="seat" id="seat" value=""><!-- 좌석 -->
                    <input type="hidden" name="price" id="price" value=""><!-- 가격 -->
                    <input type="hidden" name="day" id="day" value=""><!-- 날짜 -->
                    <input type="hidden" name="time" id="time" value=""><!-- 시간 -->
                </form>
				<div class="slcDeTail">
					<div>
						<p class="location"><span>지역</span><span class="data">서울</span></p>
						<p class="store"><span>지점</span><span class="data">노원직영점</span></p>
						<p class="seat"><span>좌석명</span><span class="data">좌석12</span></p>
					</div>
					<div>
						<p class="date"><span>날짜</span><span class="data">2021-12-10</span></p>
						<p class="time"><span>시간</span><span class="data">18:00 ~ 19:00</span></p>
					</div>
					<div>
						<p class="total">총 <span class="pay">8,000</span>원</p>
					</div>
					<button type="button" name="button" class="resBtn" id="resBtn">
						<div><img src="../images/cart_img.png" alt=""><span>예약추가</span></div>
					</button>
				</div>
			</div><!-- //reserveDiv -->
			<div class="rightFix">
				<div class="cal"><img src="../images/cal_img.png"></div>
				<div class="tabD">
					<div class="tab">
						<a href="javascript:" class="on"><span>좌석</span></a>
						<a href="javascript:"><span>사물함</span></a>
					</div>
					<div class="tabCont">
						<div class="on">
							<p class="info">예약시간 <span>(시간은 복수선택 가능합니다)</span></p>
							<div class="scrollD">
								<a href="javascript:" data-time="08" ><span class="mark">예약가능</span><span>08:00 ~ 09:00</span></a>
								<a href="javascript:" data-time="09" class="no"><span class="mark">예약완료</span><span>09:00 ~ 10:00</span></a>
								<a href="javascript:" data-time="10" ><span class="mark">예약가능</span><span>10:00 ~ 11:00</span></a>
								<a href="javascript:" data-time="11" ><span class="mark">예약가능</span><span>11:00 ~ 12:00</span></a>
								<a href="javascript:" data-time="12" ><span class="mark">예약가능</span><span>12:00 ~ 13:00</span></a>
								<a href="javascript:" data-time="13" ><span class="mark">예약가능</span><span>13:00 ~ 14:00</span></a>
								<a href="javascript:" data-time="14" ><span class="mark">예약가능</span><span>14:00 ~ 15:00</span></a>
								<a href="javascript:" data-time="15" ><span class="mark">예약가능</span><span>15:00 ~ 16:00</span></a>
								<a href="javascript:" data-time="16" ><span class="mark">예약가능</span><span>16:00 ~ 17:00</span></a>
								<a href="javascript:" data-time="17" ><span class="mark">예약가능</span><span>17:00 ~ 18:00</span></a>
								<a href="javascript:" data-time="18" ><span class="mark">예약가능</span><span>18:00 ~ 19:00</span></a>
								<a href="javascript:" data-time="19" ><span class="mark">예약가능</span><span>19:00 ~ 20:00</span></a>
								<a href="javascript:" data-time="20" ><span class="mark">예약가능</span><span>20:00 ~ 21:00</span></a>
								<a href="javascript:" data-time="21" ><span class="mark">예약가능</span><span>21:00 ~ 22:00</span></a>
								<a href="javascript:" data-time="22" ><span class="mark">예약가능</span><span>22:00 ~ 23:00</span></a>
								<a href="javascript:" data-time="23" ><span class="mark">예약가능</span><span>23:00 ~ 24:00</span></a>
							</div>
						</div><!-- //div -->
						<div>
							
						</div>
					</div><!-- //tabCont -->
				</div><!-- //tabD -->
			</div><!-- //rightFix -->
			
		</div><!-- //inner -->
	</div><!-- //reserveCont -->
<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>