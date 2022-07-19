<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="notice.model.vo.Notice"%>
<%
	Notice notice = (Notice) request.getAttribute("notice");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워크몬</title>
<link href="<%=request.getContextPath()%>/css/noticeDetail.css"
	rel="stylesheet" type="text/css" />
</head>
<body>
	<%@ include file="../common/navbar.jsp"%>
	<div id="notice_detail_wrap">
		<form id="notice_flex_box"
			action="<%=request.getContextPath()%>/noticeUpdateForm.ho"
			method="post">
			<input type="hidden" value="<%=notice.getBoardNum()%>" name="no">
			<div id="notice_part">
				<h5>공지사항</h5>
			</div>
			<div id="notice_info_box">
				<h2><%=notice.getBoardTitle()%></h2>
				<input type="hidden" name="title" placeholder="제목"
					value="<%=notice.getBoardTitle()%>" />
				<p id="notice_writer_id">
					<span>관리자</span>
				</p>
				<p id="notice_writer_date">
					등록일 : <span><%=notice.getBoardDate()%></span> ｜ 조회수 : <span><%=notice.getHits()%></span>
				</p>

				<%
					if (loginUser != null && loginUser.getUserId().equals("admin00")) {
				%>
				<button id="notice_detail_motify" type="submit">수정하기</button>
				<%
					}
				%>
			</div>
			<div id="notice_content_wrap">
				<textarea placeholder="내용을 입력해주세요" name="content" readonly><%=notice.getBoardContent()%></textarea>
				<br>
				<div id="notice_writer_butt_box">
					<input type="button" onclick="location.href='notice_index.ho'"
						id="listBtn" value="목록으로" />
					<%
						if (loginUser != null && loginUser.getUserId().equals("admin00")) {
					%>
					<input type="button" id="cancelBtn" value="삭제하기"
						onclick="deleteNotice();" />
					<%
						}
					%><br>
					<br>
				</div>
			</div>
		</form>
	</div>
	<script>
		function deleteNotice(){
			var bool = confirm('정말 삭제하시겠습니까?');
			if(bool){
				location.href='<%=request.getContextPath()%>
		/delete.no?no='
						+
	<%=notice.getBoardNum()%>
		;
			}
		}
	</script>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>