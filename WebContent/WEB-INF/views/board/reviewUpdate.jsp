<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="board.model.vo.*, java.util.*"%>
<%
	Board b = (Board) request.getAttribute("Board");
ArrayList<Attachment> imgList = (ArrayList<Attachment>) request.getAttribute("fileList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워크몬</title>
<link href="<%=request.getContextPath()%>/css/reviewWriterForm.css"
	rel="stylesheet" type="text/css" />
</head>
<body>
	<%@ include file="../common/navbarLink.jsp"%>
	<form action="<%=request.getContextPath()%>/reviewUpdate.ck"
		method="post" encType="multipart/form-data">
		<div id="notice_detail_wrap">
			<div id="notice_flex_box">
				<input type="hidden" name="boardNum" value="<%=b.getBoardNum()%>"
					style="text-index: -9999px;">
				<div id="notice_part">
					<h2 id="page_top_title">알바 후기</h2>
				</div>
				<div id="notice_info_box">
					<input type="text" name="title" value="<%=b.getBoardTitle()%>" />
				</div>
				<div id="notice_file_wrap">
					<table id="insertThumbTable">
						<tr>
							<b>대표 이미지</b>
							<td colspan="3">
								<div id="titleImgArea">
									<img
										src="<%if (!imgList.isEmpty() && imgList != null) {%><%=request.getContextPath()%>/img_uploadFiles/<%=imgList.get(0).getChangeName()%><%}%>"
										id="titleImg" style="width: 100%; height: auto">
								</div>
							</td>
						</tr>
					</table>

					<!-- 파일 업로드 하는 부분 -->
					<div id="fileArea">
						<input type="file" id="thumbnailImg1" multiple="multiple"
							name="thumbnailImg1" onchange="LoadImg(this,1)">
					</div>
					<script>
						// 내용 작성 부분의 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
						$(function() {
							$("#fileArea").hide();

							$("#titleImgArea").click(function() {
								$("#thumbnailImg1").click();
							});
						});

						// 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
						function LoadImg(value, num) {
							if (value.files && value.files[0]) {
								var reader = new FileReader();

								reader.onload = function(e) {
									switch (num) {
									case 1:
										$("#titleImg").attr("src",
												e.target.result);
										break;
									}
								}
								reader.readAsDataURL(value.files[0]); // 파일태그
							}
						}
					</script>
				</div>

				<div id="notice_content_wrap">
					<textarea name="content"><%=b.getBoardContent()%></textarea>
				</div>

				<div id="notice_writer_butt_box">
					<input type="submit" id="insertBtn" value="수정하기" /> <input
						type="button" id="cancelBtn" value="취소하기"
						onclick="location.href='<%=request.getContextPath()%>/review_index.ho'" />
				</div>
			</div>
		</div>
	</form>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>