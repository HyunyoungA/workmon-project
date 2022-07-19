<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, notice.model.vo.*"%>
<%
	ArrayList<Notice> list = (ArrayList<Notice>) request.getAttribute("list");
PageInfo pi = (PageInfo) request.getAttribute("pi");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워크몬</title>
<link href='<%=request.getContextPath()%>/css/styles.css'
	rel="stylesheet" type="text/css" />
<link href='<%=request.getContextPath()%>/css/noticeList.css'
	rel="stylesheet" type="text/css" />
</head>
<body>
	<%@ include file="../common/navbarLink.jsp"%>
	<div id="notice_wrap">
		<div class="outer">
			<div class="pageTit">
				<h2>공지 사항</h2>
				<div id="notice_writer_butt">
					<%
						if (loginUser != null && loginUser.getUserId().equals("admin00")) {
					%>
					<button
						onclick="location.href='<%=request.getContextPath()%>/notice_WriterPage.ho'">글작성</button>
					<%
						}
					%>
				</div>
			</div>
			<div class="tableArea">
				<table id="listArea">
					<tr>
						<th width="100px">글번호</th>
						<th width="500px">제목</th>
						<th width="200px">작성자</th>
						<th width="150px">작성일</th>
						<th width="100px">조회</th>
					</tr>
					<%
						if (list.isEmpty()) {
					%>
					<!-- 리스트가 없을 떄 '조회된 리스트가 없습니다'출력 -->
					<tr>
						<td colspan="5">존재하는 공지사항이 없습니다.</td>
					</tr>
					<%
						} else {
					%>
					<%
						for (Notice n : list) {
					%>
					<tr>
						<!-- 글번호, 제목, 작성자, 작성일, 조회 -->
						<td><%=n.getBoardNum()%></td>
						<td><%=n.getBoardTitle()%></td>
						<td>관리자</td>
						<td><%=n.getBoardDate()%></td>
						<td><%=n.getHits()%></td>
					</tr>
					<%
						}
					%>
					<%
						}
					%>
				</table>
			</div>
			<div class="pagingArea" align="center">
				<!-- 맨 처음으로 -->
				<button
					onclick="location.href='<%=request.getContextPath()%>/notice_index.ho?currentPage=1'">&lt;&lt;</button>
				<!-- 이전 페이지로 -->
				<button
					onclick="location.href='<%=request.getContextPath()%>/notice_index.ho?currentPage=<%=pi.getCurrentPage() - 1%>'"
					id="beforeBtn">&lt;</button>
				<script>
						if(<%=pi.getCurrentPage()%> <= 1){
							$('#beforeBtn').prop('disabled', true);
						}
					</script>
				<!-- 숫자 페이지로 -->
				<%
					for (int p = pi.getStartPage(); p <= pi.getEndPage(); p++) {
				%>
				<%
					if (p == pi.getCurrentPage()) {
				%>
				<button id="choosen" disabled><%=p%></button>
				<%
					} else {
				%>
				<button id="numBtn"
					onclick="location.href='<%=request.getContextPath()%>/notice_index.ho?currentPage=<%=p%>'"><%=p%></button>
				<%
					}
				%>
				<%
					}
				%>
				<!-- 다음 페이지로 -->
				<button
					onclick="location.href='<%=request.getContextPath()%>/notice_index.ho?currentPage=<%=pi.getCurrentPage() + 1%>'"
					id="afterBtn">&gt;</button>
				<script>
						if(<%=pi.getCurrentPage()%> >= <%=pi.getMaxPage()%>){
							$('#afterBtn').prop('disabled', true);
						}
					</script>
				<!-- 맨 마지막으로 -->
				<button
					onclick="location.href='<%=request.getContextPath()%>/notice_index.ho?currentPage=<%=pi.getMaxPage()%>'">&gt;&gt;</button>
			</div>
		</div>
	</div>
	<script>
		$(function(){
			$('#listArea td').mouseenter(function(){
				$(this).parent().css({'background': 'darkgray', 'cursor':'pointer'});
			}).mouseout(function(){
				$(this).parent().css('background','none');
			}).click(function(){
				var num = $(this).parent().children().eq(0).text();
				location.href = '<%=request.getContextPath()%>/notice_detailPage.ho?no='+ num;
			});
		});
	</script>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>