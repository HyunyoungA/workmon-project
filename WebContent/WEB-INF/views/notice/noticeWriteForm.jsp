<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워크몬</title>
<link href="<%=request.getContextPath()%>/css/noticeWriteForm.css"
	rel="stylesheet" type="text/css" />
</head>
<body>
	<%@ include file="../common/navbar.jsp"%>
	<div id="notice_detail_wrap">
		<div id="notice_flex_box">
			<div id="notice_part">
				<h5>공지사항</h5>
			</div>
			<form action="<%=request.getContextPath()%>/insert.no"
				method="post">
				<div id="notice_info_box">
					<input type="text" name="title" placeholder="제목" />
				</div>

				<div id="notice_content_wrap">
					<textarea placeholder="내용을 입력해주세요" name="content"></textarea>
				</div>

				<div id="notice_writer_butt_box">
					<input type="submit" id="insertNoBtn" value="작성하기" /> <input
						type="button" onclick="location.href='javascript:history.go(-1);'"
						id="cancelBtn" value="취소하기" />
				</div>
			</form>
		</div>
	</div>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>