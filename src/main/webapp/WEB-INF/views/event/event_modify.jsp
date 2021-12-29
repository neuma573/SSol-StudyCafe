<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 -->
<div class="subTit">
	<h2>이벤트</h2>
</div>
<div class="container eventV">
	<div class="event_inner inner">
		<form name="modifyFrm" action="eventmodify.do" method="post"
			enctype="multipart/form-data" accept-charset="UTF-8">
			<input type="hidden" name="e_number" value="${dto.e_number}">
			<input type="hidden" name="en_email" value="${dto.en_email}"> 
			<div class="eveWrite revWrite">
				<div class="left">
					<h3>이벤트 수정</h3>
					<p>수정할 내용을 입력해 주세요.</p>
				</div><!-- //left -->
				<div class="right">
					<div class="formCont">
						<dl>
							<dt>제목</dt>
							<dd>
								<input type="text" name="subject" placeholder="제목을 입력해주세요" value="${dto.e_title}">
							</dd>
						</dl>
						<dl class="dateD">
							<dt>이벤트 기간</dt>
							<dd>
								<input type="date" name="e_start" placeholder="시작일" value="${dto.e_start}">
								<span>~</span>
								<input type="date" name="e_end" placeholder="종료일" value="${dto.e_end}">
							</dd>
						</dl>
						<dl>
							<dt>당첨자 수</dt>
							<dd>
								<input type="number" name="e_winners" placeholder="당첨자 수를 입력해주세요" value="${dto.e_winners}">
							</dd>
						</dl>
						<dl>
							<dt>당첨 금액</dt>
							<dd>
								<input type="number" name="e_money" placeholder="당첨 금액을 입력해주세요" value="${dto.e_money}">
							</dd>
						</dl>
						<dl>
							<dt>내용</dt>
							<dd>
								<textarea name="e_content" placeholder="이벤트 내용" value="${dto.e_content}"></textarea>
							</dd>
						</dl>
						<dl>
							<dt>이미지등록</dt>
							<dd class="fileD">
								<p class="filebox">
									<input type="file" id="eimgMF" name="eimgMF"
										class="uploadHid" accept=".gif, .jpg, .png"> <label
										for="eimgMF">파일선택</label>
								</p>
								<div class="preview"></div>
								<p class="infoTxt">※ JPG, PNG, GIF 파일만 추가 가능</p>
							</dd>
						</dl>
					</div><!-- //formCont  -->
				</div><!-- // right  -->
			</div>
			<div class="btnD bdT">
				<p class="btn">
					<input type="submit" value="수정">
				</p>
				<a href="/evnetview.do" class="btn del"><span>취소</span></a>
			</div>
		</form>
	</div>
</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>