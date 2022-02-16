<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 -->

<div class="subTit">
	<h2>공지사항</h2>
</div>
<div class="container inquiry_wrap">
	<div class="inner">
		<form name="inquiry_write" action="/notice/notice_write.do" method="post" action="submit" class="inquiry_form">
			<input type="hidden" name="en_email" value="${uid}">
			<div class="revWrite">
				<div class="left">
					<h3>공지사항 등록</h3>
					<p>내용을 입력해 주세요.</p>
					<p></p>
				</div><!-- //left -->
				<div class="right">
					<div class="formCont">
						<dl>
							<dt>지점명</dt>
							<dd>
							 	<select name="store_no" class="store_name">
									<option value="none">지점명을 선택해주세요</option>
									<c:forEach var="storeList" items="${storeList}">
										<option value="${storeList.store_no}">${storeList.store_name}</option>
									</c:forEach>
								</select>
							</dd>
						</dl>
						<dl>
							<dt>제목</dt>
							<dd>
								<input type="text" class="" name="n_title" id="title" placeholder="공지사항 제목을 입력해주세요" autocomplete="off">
							</dd>
						</dl>
						<dl>
						<dt>내용</dt>
						<dd>
							<textarea name="n_content" id="n_content" placeholder="공지사항 내용을 입력해주세요" required=""></textarea>
						</dd>
					</dl>
					</div>
				</div><!-- //right  -->
			</div><!-- //revWrite -->
			<div class="btnD bdT">
				<p class="btn">
					<input type="submit" value="등록">
				</p>
				<a href="javascript:history.back()" class="btn del"><span>취소</span></a>
			</div>
		</form>
	</div><!-- //inner  -->

</div><!-- //inquiry_wrap -->



<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>