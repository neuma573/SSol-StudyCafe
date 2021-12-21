<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!-- 본문시작 -->
	<div class="subTit bg" style="background-image:url('../images/place_img1.jpg')">
		<h2>${requestScope.store_name}</h2>
	</div>
	<div class="container placeRev">
		<div class="inner">
			<form action="/placewrite.do" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
			<input type="hidden" name="store_no" value="${requestScope.store_no}">	
			<input type="hidden" name="store_name" value="${requestScope.store_name}">	
			<div class="revWrite">
				<div class="left">
					<h3>리뷰등록</h3>
					<p>내용을 입력해 주세요.</p>
				</div><!-- //left -->
				<div class="right">
					<div class="formCont">
						<dl class="score">
							<dt>별점</dt>
							<dd>
								<div class="click_score">
									<a href="javascript:"><span class="off"></span><span class="on"></span></a>
									<a href="javascript:"><span class="off"></span><span class="on"></span></a>
									<a href="javascript:"><span class="off"></span><span class="on"></span></a>
									<a href="javascript:"><span class="off"></span><span class="on"></span></a>
									<a href="javascript:"><span class="off"></span><span class="on"></span></a>
								</div>
								<input type="hidden" name="rev_score" id="rev_score" value="" >
							</dd>
						</dl>
						<dl>
							<dt>제목</dt>
							<dd><input type="text" name="rev_title" placeholder="제목을 입력해주세요" ></dd>
						</dl>
						<dl>
							<dt>이메일</dt>
							<dd><input type="text" name="in_email" placeholder="로그인 이메일 들어감" ></dd>
						</dl>
						<dl>
							<dt>내용</dt>
							<dd>
								<textarea name="rev_content" placeholder="후기를 남겨주세요."></textarea>
							</dd>
						</dl>
						<dl>
							<dt>이미지등록</dt>
							<dd class="fileD">
								<p class="filebox">
									<input type="file" id="revimgMF" name="revimgMF" class="uploadHid" accept=".gif, .jpg, .png, .jpeg">
									<label for="revimgMF">파일선택</label>
								</p>
								<div class="preview"></div>
								<p class="infoTxt">※ JPG, PNG, GIF 파일만 추가 가능</p>
							</dd>
						</dl>					
					</div><!-- //formCont -->
				</div><!-- //right -->				
			</div><!-- //revWrite -->
			<div class="btnD bdT">
				<p class="btn"><input type="submit" value="등록"></p>
				<a href="javascript:" class="btn del"><span>취소</span></a>
			</div>
			</form>
		</div>
	</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>