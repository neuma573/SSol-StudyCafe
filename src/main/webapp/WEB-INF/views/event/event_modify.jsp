<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 -->
<div class="subTit">
	<h2>이벤트</h2>
</div>
<div class="container eventRev">
	<div class="event_inner">
		<div class="eveWrite">
			<div class="right">
				<div class="formCont">
					<dl>
						<dt>제목</dt>
						<dd>
							<input type="text" name="subject" placeholder="제목을 입력해주세요">
						</dd>
					</dl>
					<dl>
						<dt>이벤트 기간</dt>
						<dd>
							<input type="date" name="start" placeholder="시작일">
							<input type="date" name="end" placeholder="종료일">
						</dd>
					</dl>
					<dl>
						<dt>당첨자 수</dt>
						<dd>
							<input type="number" name="prizewinner" placeholder="당첨자 수를 입력해주세요">
						</dd>
					</dl>
					<dl>
						<dt>당첨 금액</dt>
						<dd>
							<input type="number" name="prizemoney" placeholder="당첨 금액을 입력해주세요">
						</dd>
					</dl>
					<dl>
						<dt>내용</dt>
						<dd>
							<textarea name="revCont" placeholder="이벤트 내용"></textarea>
						</dd>
					</dl>
					<dl>
						<dt>이미지등록</dt>
						<dd class="fileD">
							<p class="filebox">
								<input type="file" id="filenameMF" name="filenameMF"
									class="uploadHid" accept=".gif, .jpg, .png"> <label
									for="filenameMF">파일선택</label>
							</p>
							<div class="preview"></div>
							<p class="infoTxt">※ JPG, PNG, GIF 파일만 추가 가능</p>
						</dd>
					</dl>
				</div>
			</div>
		</div>
		<div class="btnD bdT">
			<p class="btn">
				<input type="submit" value="수정">
			</p>
			<a href="/evnetview.do" class="btn del"><span>취소</span></a>
		</div>
	</div>
</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>