<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../header.jsp" %>
<script src="../js/res_script.js"></script>

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
							<option value="none">지역을 선택해주세요</option>
						</select>
					</div>	
					<div class="nameSlc">
						<span>지점명</span>
						<select class="store">
							<option value="none">지점을 선택해주세요</option>
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
									<a href="javascript:" data-val="desk_1" class="desk seat"><span>좌석1</span></a><!-- 클래스 no 붙으면 선택 불가 / max 31 -->
									<a href="javascript:" data-val="desk_2" class="desk seat"><span>좌석2</span></a>
									<a href="javascript:" data-val="desk_3" class="desk seat"><span>좌석3</span></a>
									<a href="javascript:" data-val="desk_4" class="desk seat"><span>좌석4</span></a>
									<a href="javascript:" data-val="desk_5" class="desk seat"><span>좌석5</span></a>
									<a href="javascript:" data-val="desk_6" class="desk seat"><span>좌석6</span></a>
									<a href="javascript:" data-val="desk_7" class="desk seat"><span>좌석7</span></a>
									<a href="javascript:" data-val="desk_8" class="desk seat"><span>좌석8</span></a>
									<a href="javascript:" data-val="desk_9" class="desk seat"><span>좌석9</span></a>
									<a href="javascript:" data-val="desk_10" class="desk seat"><span>좌석10</span></a>
									<a href="javascript:" data-val="desk_11" class="desk seat"><span>좌석11</span></a>
									<a href="javascript:" data-val="desk_12" class="desk seat"><span>좌석12</span></a>
									<a href="javascript:" data-val="desk_13" class="desk seat"><span>좌석13</span></a>
									<a href="javascript:" data-val="desk_14" class="desk seat"><span>좌석14</span></a>
									<a href="javascript:" data-val="desk_15" class="desk seat"><span>좌석15</span></a>
									<a href="javascript:" data-val="desk_16" class="desk seat"><span>좌석16</span></a>
									<a href="javascript:" data-val="desk_17" class="desk seat"><span>좌석17</span></a>
									<a href="javascript:" data-val="desk_18" class="desk seat"><span>좌석18</span></a>
									<a href="javascript:" data-val="desk_19" class="desk seat"><span>좌석19</span></a>
									<a href="javascript:" data-val="desk_20" class="desk seat"><span>좌석20</span></a>
									<a href="javascript:" data-val="desk_21" class="desk seat"><span>좌석21</span></a>
									<a href="javascript:" data-val="desk_22" class="desk seat"><span>좌석22</span></a>
									<a href="javascript:" data-val="desk_23" class="desk seat"><span>좌석23</span></a>
									<a href="javascript:" data-val="desk_24" class="desk seat"><span>좌석24</span></a>
									<a href="javascript:" data-val="desk_25" class="desk seat"><span>좌석25</span></a>
									<a href="javascript:" data-val="desk_26" class="desk seat"><span>좌석26</span></a>
									<a href="javascript:" data-val="desk_27" class="desk seat"><span>좌석27</span></a>
									<a href="javascript:" data-val="desk_28" class="desk seat"><span>좌석28</span></a>
									<a href="javascript:" data-val="desk_29" class="desk seat"><span>좌석29</span></a>
									<a href="javascript:" data-val="desk_30" class="desk seat"><span>좌석30</span></a>
									<a href="javascript:" data-val="desk_31" class="desk seat"><span>좌석31</span></a>
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
							<div class="seatInfo">
								<span>선택가능</span>
								<span>선택함</span>
								<span>선택불가</span>
							</div>
							<div class="lockerDiv">
								<div class="lockerD">
									<a href="javascript:" class="locker no"><span>사물함1</span></a>
									<a href="javascript:" class="locker"><span>사물함2</span></a>
									<a href="javascript:" class="locker"><span>사물함3</span></a>
									<a href="javascript:" class="locker"><span>사물함4</span></a>
									<a href="javascript:" class="locker"><span>사물함5</span></a>
									<a href="javascript:" class="locker"><span>사물함6</span></a>
									<a href="javascript:" class="locker"><span>사물함7</span></a>
									<a href="javascript:" class="locker"><span>사물함8</span></a>
									<a href="javascript:" class="locker"><span>사물함9</span></a>
									<a href="javascript:" class="locker"><span>사물함10</span></a>
									<a href="javascript:" class="locker"><span>사물함11</span></a>
									<a href="javascript:" class="locker"><span>사물함12</span></a>
									<a href="javascript:" class="locker"><span>사물함13</span></a>
									<a href="javascript:" class="locker"><span>사물함14</span></a>
									<a href="javascript:" class="locker"><span>사물함15</span></a>
									<a href="javascript:" class="locker"><span>사물함16</span></a>
									<a href="javascript:" class="locker"><span>사물함17</span></a>
									<a href="javascript:" class="locker"><span>사물함18</span></a>
									<a href="javascript:" class="locker"><span>사물함19</span></a>
									<a href="javascript:" class="locker"><span>사물함10</span></a>
								</div>
							</div>
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
						<p class="location"><span>지역</span><span class="data"></span></p>
						<p class="store"><span>지점</span><span class="data"></span></p>
						<p class="seat"><span>좌석명</span><span class="data"></span></p>
					</div>
					<div>
						<p class="date"><span>날짜</span><span class="data"></span></p>
						<p class="time"><span>시간</span><span class="data"></span></p>
					</div>
					<div>
						<p class="total">총<span class="pay">0</span>원</p>
					</div>
					<button type="button" name="button" class="resBtn" id="resBtn" onclick="javascript:resScript.resAddClick(); return false;">
						<div><img src="../images/cart_img.png" alt=""><span>예약추가</span></div>
					</button>
				</div>
			</div><!-- //reserveDiv -->
			<div class="rightFix">
				<div class="cal">
					<input type="hidden" name="today" value="" id="today">
					<div class="calSel">
						<select id="year" name="year">
						</select>
						<select id="month" name="month">
						</select> 
					</div>						
					<div class="calTable">
						<table>
							<thead>
								<tr>
									<th class="red">일</th>
									<th>월</th>
									<th>화</th>
									<th>수</th>
									<th>목</th>
									<th>금</th>
									<th>토</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><a href="javascript:" name="day" class="day" alt=""></a></td>
									<td><a href="javascript:" name="day" class="day" alt=""></a></td>
									<td><a href="javascript:" name="day" class="day" alt=""></a></td>
									<td><a href="javascript:" name="day" class="day" alt=""></a></td>
									<td><a href="javascript:" name="day" class="day" alt=""></a></td>
									<td><a href="javascript:" name="day" class="day" alt=""></a></td>
									<td><a href="javascript:" name="day" class="day" alt=""></a></td>
								</tr>
								<tr>
									<td><a href="javascript:" name="day" class="day" alt=""></a></td>
									<td><a href="javascript:" name="day" class="day" alt=""></a></td>
									<td><a href="javascript:" name="day" class="day" alt=""></a></td>
									<td><a href="javascript:" name="day" class="day" alt=""></a></td>
									<td><a href="javascript:" name="day" class="day" alt=""></a></td>
									<td><a href="javascript:" name="day" class="day" alt=""></a></td>
									<td><a href="javascript:" name="day" class="day" alt=""></a></td>
								</tr>
								<tr>
									<td><a href="javascript:" name="day" class="day" alt=""></a></td>
									<td><a href="javascript:" name="day" class="day" alt=""></a></td>
									<td><a href="javascript:" name="day" class="day" alt=""></a></td>
									<td><a href="javascript:" name="day" class="day" alt=""></a></td>
									<td><a href="javascript:" name="day" class="day" alt=""></a></td>
									<td><a href="javascript:" name="day" class="day" alt=""></a></td>
									<td><a href="javascript:" name="day" class="day" alt=""></a></td>
								</tr>
								<tr>
									<td><a href="javascript:" name="day" class="day" alt=""></a></td>
									<td><a href="javascript:" name="day" class="day" alt=""></a></td>
									<td><a href="javascript:" name="day" class="day" alt=""></a></td>
									<td><a href="javascript:" name="day" class="day" alt=""></a></td>
									<td><a href="javascript:" name="day" class="day" alt=""></a></td>
									<td><a href="javascript:" name="day" class="day" alt=""></a></td>
									<td><a href="javascript:" name="day" class="day" alt=""></a></td>
								</tr>
								<tr>
									<td><a href="javascript:" name="day" class="day" alt=""></a></td>
									<td><a href="javascript:" name="day" class="day" alt=""></a></td>
									<td><a href="javascript:" name="day" class="day" alt=""></a></td>
									<td><a href="javascript:" name="day" class="day" alt=""></a></td>
									<td><a href="javascript:" name="day" class="day" alt=""></a></td>
									<td><a href="javascript:" name="day" class="day" alt=""></a></td>
									<td><a href="javascript:" name="day" class="day" alt=""></a></td>
								</tr>
								<tr>
									<td><a href="javascript:" name="day" class="day" alt=""></a></td>
									<td><a href="javascript:" name="day" class="day" alt=""></a></td>
									<td><a href="javascript:" name="day" class="day" alt=""></a></td>
									<td><a href="javascript:" name="day" class="day" alt=""></a></td>
									<td><a href="javascript:" name="day" class="day" alt=""></a></td>
									<td><a href="javascript:" name="day" class="day" alt=""></a></td>
									<td><a href="javascript:" name="day" class="day" alt=""></a></td>
								</tr>
							</tbody>
						</table>
					</div>	
				</div><!-- // cal -->
				<div class="tabD">
					<div class="tab">
						<a href="javascript:" class="on"><span>좌석</span></a>
						<a href="javascript:"><span>사물함</span></a>
					</div>
					<div class="tabCont">
						<div class="resTime on">
							<p class="info">예약시간 <span>(시간은 복수선택 가능합니다)</span></p>
							<div class="none"><span>좌석을 선택해 주세요.</span></div>
							<div class="scrollD"><!-- a태그에 class="no" 붙으면 예약완료 -->
								<a href="javascript:" data-time="08" ><span class="mark">예약가능</span><span>08:00 ~ 09:00</span></a>
								<a href="javascript:" data-time="09" ><span class="mark">예약가능</span><span>09:00 ~ 10:00</span></a>
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
						<div class="resDay">
							<p class="info">예약날짜</p>
							<div class="none"><span>사물함을 선택해 주세요.</span></div>
							<div class="scrollD">
							<a href="javascript:" data-week="4" ><span class="mark">예약가능</span><span>4주 (2021-12-10 ~ 2122-01-07)</span></a>
								<a href="javascript:" data-week="4" ><span class="mark">예약가능</span><span>8주 (2021-12-10 ~ 2122-02-04)</span></a>
								<a href="javascript:" data-week="4" ><span class="mark">예약가능</span><span>12주 (2021-12-10 ~ 2122-03-04)</span></a>
							</div>
						</div><!-- //resDay -->
					</div><!-- //tabCont -->
				</div><!-- //tabD -->
			</div><!-- //rightFix -->
			
		</div><!-- //inner -->
		
		<div class="resCheck inner">
			<p class="tit">예약확인</p>
			<div class="listD">
				<!-- <div class="list">
					<div>
						<p class="num">1</p>
						<p class="location">서울</p>
						<p class="store">목동직영점</p>
						<p class="seat">좌석12</p>
						<p class="date">2021-12-09</p>
						<p class="time">18:00 ~ 19:00</p>
						<p class="pay">3,000원</p>
					</div>
					<a href="javascript:" class="del">삭제</a>
				</div> -->
			</div>
			<div class="resTotD">
				<p class="tit">결제금액 확인</p>
				<div class="resTot seatT">
					<p>좌석 총 개수 : <span class="num">0</span></p>
					<p>총 금액(기본가 시간당 1,500원) : <span class="pay">0</span>원</p>
					<p>할인 적용된 총 금액 : <span class="disPay">0</span>원</p>
				</div>
				<div class="resTot roomT">
					<p>ROOM 총 개수 : <span class="num">0</span></p>
					<p>총 금액(기본가 시간당 6,000원) : <span class="pay">0</span>원</p>
					<p>할인 적용된 총 금액 : <span class="disPay">0</span>원</p>
				</div>
				<div class="resTot lockerT">
					<p>사물함 총 개수 : <span class="num">0</span></p>
					<p>총 금액 : <span class="pay">0</span>원</p>
				</div>
			</div>
		</div><!-- //resCheck -->
		
		<div class="totalPay">
			<a href="javascript:">
				<p>총 <span class="num">0</span>건</p><p><span class="pay">0</span>원</p>
				결제하기
			</a>
		</div>
	</div><!-- //reserveCont -->
	
<!-- 본문끝 -->
<script>
	$(function(){
		/* 
		
		$(".reserveCont select.store").change(function(){// 지점명을 선택하면
			if($(this).val() !== "none"){
				$(".reserveCont .seatDiv .deskD").empty();
				$(".reserveCont .seatDiv .roomD").empty();
				$(".reserveCont .lockerDiv .lockerD").empty();
				
				for(var i=0; i<resStoreArr.length; i++){
					if(resStoreArr[i].store_no == $(this).val()){
						for(var n=0; n<resStoreArr[i].dcnt; n++){ // 좌석 
							$(".reserveCont .seatDiv .deskD").append("<a href='javascript:' class='desk seat' data-val='desk_"+(n+1)+"'><span>좌석"+(n+1)+"</span></a>");			
						}
						
						for(var n=0; n<resStoreArr[i].rcnt; n++){ // ROOM
							$(".reserveCont .seatDiv .roomD").append("<a href='javascript:' class='room seat' data-val='room_"+(n+1)+"'><span>ROOM"+(n+1)+"</span></a>");			
						}
						
						for(var n=0; n<resStoreArr[i].bcnt; n++){ // 사물함 
							$(".reserveCont .lockerDiv .lockerD").append("<a href='javascript:' class='locker' data-val='locker_"+(n+1)+"'><span>사물함"+(n+1)+"</span></a>");			
						}
					}	
				}
				
				resScript.seatClick(); //좌석 선택 
				resScript.lockerClick(); //사물함 선택 			
			}
		}); */
			
	});
	
</script>
<%@ include file="../footer.jsp" %>