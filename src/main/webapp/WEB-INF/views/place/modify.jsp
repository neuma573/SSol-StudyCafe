<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!-- 본문시작 -->
	<div class="subTit bg" style="background-image:url('../images/place_img1.jpg')">
		<h2>${requestScope.store_name}</h2>
	</div>
	<div class="container placeRev">
		<div class="inner">
			<form name="modifyFrm" action="placemodify.do" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
			<input type="hidden" name="store_name" value="${requestScope.store_name}">
			<input type="hidden" name="store_no" value="${dto.store_no}">	
			<input type="hidden" name="rev_number" value="${dto.rev_number}">	
			<div class="revWrite">
				<div class="left">
					<h3>리뷰 수정</h3>
					<p>수정할 내용을 입력해 주세요.</p>
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
								<input type="hidden" name="rev_score" id="rev_score" value="${dto.rev_score}" >
							</dd>
						</dl>
						<dl>
							<dt>제목</dt>
							<dd><input type="text" name="rev_title" placeholder="제목을 입력해주세요" value="${dto.rev_title}" ></dd>
						</dl>
						<dl>
							<dt>내용</dt>
							<dd>
								<textarea name="rev_content" placeholder="후기를 남겨주세요.">${dto.rev_content}</textarea>
							</dd>
						</dl>
						<dl>
							<dt>이미지등록</dt>
							<dd class="fileD">
								<p class="filebox">
									<input type="file" id="revimgMF" name="revimgMF" class="uploadHid" accept=".gif, .jpg, .png, .jpeg">
									<label for="revimgMF">파일선택</label>
								</p>
								<div class="preview">
									<p class="file"><span>${dto.rev_image}</span><a href="javascript:" class="del">삭제</a></p>
								</div>
								<p class="infoTxt">※ JPG, PNG, GIF 파일만 추가 가능</p>
							</dd>
						</dl>
					</div><!-- //formCont -->
				</div><!-- //right -->				
			</div><!-- //revWrite -->
			<div class="btnD bdT">
				<p class="btn"><input type="submit" value="수정"></p>
				<a href="placelist.do?store_no=${dto.store_no}&store_name=${requestScope.store_name}" class="btn del"><span>취소</span></a>
			</div>
			</form>
		</div>
	</div>
<script>
	$(function(){
		for(var i=0; i<${dto.rev_score}; i++){
			$(".click_score a").eq(i).addClass("check");			
		}
		
		if($(".preview .file > span").text() == ''){
			$(".preview").empty();
		}
	});
</script>
<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>