<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, board.model.vo.*, member.model.vo.Member"%>
<%
	ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");
PageInfo pi = (PageInfo) request.getAttribute("pi");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워크몬</title>
<link href='<%=request.getContextPath()%>/css/styles.css'
	rel="stylesheet" type="text/css" />
<link href='<%=request.getContextPath()%>/css/reviewList.css'
	rel="stylesheet" type="text/css" />
</head>
<body>
	<%@ include file="../common/navbarLink.jsp"%>
	<div id="review_wrap">
		<div class="outer">
			<div class="pageTit">
				<h2>알바 후기</h2>
				<%
					if (loginUser != null && loginUser.getUserTYPE() == 1) {
				%>
				<div id="notice_writer_butt">
					<button onclick="location.href='review_WriterPage.ho'">글작성</button>
				</div>
				<%
					}
				%>
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
						<td colspan="5">조회된 리스트가 없습니다</td>
					</tr>
					<%
						} else {
					%>
					<%
						for (Board b : list) {
					%>
					<tr id="listArea">
						<!-- 글번호, 제목, 작성자, 작성일, 조회 -->
						<td><%=b.getBoardNum()%></td>
						<td><%=b.getBoardTitle()%></td>
						<td><%=b.getUserId()%></td>
						<td><%=b.getBoardDate()%></td>
						<td><%=b.getHits()%></td>
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
					onclick="location.href='<%=request.getContextPath()%>/review_index.ho?currentPage=1'">&lt;&lt;</button>
				<!-- 이전 페이지로 -->
				<button
					onclick="location.href='<%=request.getContextPath()%>/review_index.ho?currentPage=<%=pi.getCurrentPage() - 1%>'"
					id="beforeBtn">&lt;</button>
				<script>
					if (
				<%=pi.getCurrentPage()%>
					<= 1) {
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
					onclick="location.href='<%=request.getContextPath()%>/review_index.ho?currentPage=<%=p%>'"><%=p%></button>
				<%
					}
				%>
				<%
					}
				%>
				<!-- 다음 페이지로 -->
				<button
					onclick="location.href='<%=request.getContextPath()%>/review_index.ho?currentPage=<%=pi.getCurrentPage() + 1%>'"
					id="afterBtn">&gt;</button>
				<script>
					if (
				<%=pi.getCurrentPage()%>
					>=
				<%=pi.getMaxPage()%>
					) {
						$('#afterBtn').prop('disabled', true);
					}
				</script>
				<!-- 맨 마지막으로 -->
				<button
					onclick="location.href='<%=request.getContextPath()%>/review_index.ho?currentPage=<%=pi.getMaxPage()%>'">&gt;&gt;</button>
			</div>
		</div>
	</div>
	<script>
	$(function(){
        $('#listArea td').mouseenter(function() {
           $(this).parent().css({'background':'darkgray', 'cursor':'pointer'});
        }).mouseout(function() {
           $(this).parent().css('background','none');
        }).click(function() {
           var bId = $(this).parent().children().eq(0).text();
           
           if('<%= loginUser%>' != 'null') {
              location.href = '<%= request.getContextPath() %>/reviewDetail.bo?bId=' + bId;   
           }else {
              alert('회원만 이용할 수 있는 서비스입니다. ')
           }
           
        })
     })
	</script>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>