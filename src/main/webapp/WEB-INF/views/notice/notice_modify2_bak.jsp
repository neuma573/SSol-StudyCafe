<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 -->

	<%
		String uid = "";
	%>
	<%
	if (!session.getAttribute("uid").equals("admin")) {
	%>
						
						<script>
		alert('권한이 없습니다');
		location.href = "/home.do"
	</script>
	<%
		}
	%>
<div class="subTit">
	<h2>공지사항</h2>
</div>

<div class="container inquiry_wrap">
	<div class="inner">
		<form name="inquiry_write" action="notice_modifySubmit.do?n_number=${dto.n_number}" method="post" action="submit" class="inquiry_form">
			<div class="revWrite">
				<div class="left">
					<h3>공지사항 등록</h3>
					<p>내용을 입력해 주세요.</p>
				</div><!-- //left -->
				<div class="right">
					<div class="formCont">
						<dl>
							<dt>제목</dt>
							<dd>
								<input type="text" class="w464" name="n_title" id="title" placeholder="공지사항 제목을 입력해주세요" required="" autocomplete="off" value="${dto.n_title}">
							</dd>
						</dl>
						<dl>
						<dt>내용</dt>
						<dd>
							<textarea name="n_contents" id="n_contents" placeholder="공지사항 내용을 입력해주세요" required="">${dto.n_contents}</textarea>
						</dd>
					</dl>
					</div>
				</div><!-- //right  -->
			</div><!-- //revWrite -->
			<div class="btnD bdT">
				<p class="btn"><input type="submit" value="수정"></p>
			</div>
				
		</form>	
	
	
	<!-- 
		<form name="inquiry_write" action="notice_modifySubmit.do?n_number=${dto.n_number}" method="post"
			action="submit"
			class="inquiry_form">
			<fieldset class="iqr_info">
				<table summary="상담자 정보 입력사항" class="inquiry_table">
					<caption class="indent">상담자 정보 입력사항</caption>
					<colgroup>
						<col width="218px">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row"><label for="n_title">제목</label></th>
							<td><input type="text" class="w464" name="n_title"
								id="title" required="" autocomplete="off" value="${dto.n_title}"></td>
						</tr>


						<tr class="cont">
							<th scope="row" class="v_top row_top"><label
								for="contents">내용</label></th>
							<td><textarea name="n_contents" id="n_contents"
									required="">${dto.n_contents}</textarea></td>
						</tr>
					</tbody>
				</table>
				
				<button type="submit" class="share_btn">제출</button>
				
				
			</fieldset>
		</form> 
		 -->
	</div><!-- //inner -->
</div><!-- // inquiry_wrap-->


<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>