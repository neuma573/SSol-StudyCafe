<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 -->
<div class="subTit">
	<h2>지점 추가</h2>
</div>
<div class="container">
	<div class="place_add">
		<form action="/mypage/place_add.do" method="post"
			enctype="multipart/form-data" accept-charset="UTF-8">
			<div class="right">
				<div class="formCont">
					<dl>
						<dt>매장명</dt>
						<dd>
							<input type="text" name="store_name" placeholder="매장명을 입력해주세요" required>
						</dd>
					</dl>
					<dl>
						<dt>사업자 번호</dt>
						<dd>
							<input type="text" name="store_en_no" placeholder="XXX-XX-XXXXX" required>
						</dd>
					</dl>
					<dl>
						<dt>주소</dt>
						<dd>
							<input type="text" name="store_address" placeholder="주소를 입력해주세요" required>
						</dd>
					</dl>
					<dl>
						<dt>운영시간</dt>
						<dd>
							<input type="text" name="operating_hours" placeholder="운영시간을 입력해주세요" required>
						</dd>
					</dl>
	
					<dl>
						<dt>스터디룸 개수</dt>
						<dd>
							<input type="text" name="room_count" placeholder="스터디룸 개수를 입력해주세요" required>
						</dd>
					</dl>
					<dl>
						<dt>좌석 개수</dt>
						<dd>
							<input type="text" name="desk_count" placeholder="좌석 개수를 입력해주세요" required>
						</dd>
					</dl>
					<dl>
						<dt>사물함 개수</dt>
						<dd>
							<input type="text" name="box_count" placeholder="사물함 개수를 입력해주세요"  required>
						</dd>
					</dl>
					<dl>
						<dt>전화번호</dt>
						<dd>
							<input type="text" name="tel" placeholder="전화번호를 입력해주세요"  required>
						</dd>
					</dl>
					<dl>
						<dt>이미지등록</dt>
						<dd class="fileD">
							<p class="filebox">
								<input type="file" id="revimgMF" name="revimgMF"
									class="uploadHid" accept=".gif, .jpg, .png, .jpeg"  required> <label
									for="revimgMF">파일선택</label>
							</p>
							<div class="preview"></div>
							<p class="infoTxt">※ JPG, PNG, GIF 파일만 추가 가능</p>
						</dd>
					</dl>
				</div>
				<!-- //formCont -->
			</div>
			<!-- //right -->
			<div style="margin-bottom: 40px;"></div>
			<div class="btnD">
				 <input type="submit"
				class="join_button" value="지점등록">
			</div>
			<div style="margin-bottom: 30px;"></div>
		</form>
	</div>
</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>





