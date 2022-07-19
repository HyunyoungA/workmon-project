<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, part_time.model.vo.*"%>
<%
	ArrayList<PartTime> list = (ArrayList) request.getAttribute("list");
PageInfo pi = (PageInfo) request.getAttribute("pi");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>워크몬</title>
<link
	href="<%=request.getContextPath()%>/css/short_part_time_index.css"
	rel="stylesheet" type="text/css" />
</head>
<body>
	<%@ include file="../common/navbarLink.jsp"%>

	<div id="notice_detail_wrap">
		<div id="job_id"
			style="width: 900px; margin: auto; position: relative;">
			<div class="box">
				<div id="b"></div>
				<div id="text">
					<b>일일알바</b>
				</div>
				<div id="part_time_writer_butt">
					<%
						if (loginUser != null && loginUser.getUserId().equals("admin") || loginUser != null && loginUser.getUserTYPE() == 2) {
					%>
					<button
						onclick='location.href="<%=request.getContextPath()%>/dailyPartTimeWriter.dw"'>공고등록</button>
					<%
						}
					%>
				</div>
			</div>
			<hr id="hr">
			<table class="table1">
				<tr>
					<th class="short">지역</th>
					<th class="long">모집내용</th>
					<th class="short">기업명</th>
					<th class="short">급여(원)</th>
					<th class="short">근무기간</th>
					<th class="short">등록일</th>
				</tr>
			</table>
			<hr id="hr2">
			<table class="table1">
				<%
					if (list.isEmpty()) {
				%>
				<tr>
					<td colspan="6">모집 중인 일일알바가 없습니다.</td>
				</tr>
				<%
					} else {
				%>
				<%
					for (PartTime p : list) {
				%>
				<tr id="listArea">
					<td class="short" style="display: none;"><%=p.getBoardNum()%></td>
					<td class="short" style="text-align: left !important;"><%=p.getArea()%></td>
					<td class="long"><%=p.getBoardTitle()%></td>
					<td class="short"><%=p.getCompanyName()%></td>
					<td class="short"><%=p.getSalary()%></td>
					<td class="short"><%=p.getWorkPeriod()%></td>
					<td class="short"><%=p.getBoardDate()%></td>
				</tr>
				<%
					}
				%>
				<%
					}
				%>
			</table>
		</div>

		<!-- 페이징 -->
		<div class="pagingArea" align="center">
			<!-- 맨 처음으로 -->
			<button
				onclick="location.href='<%=request.getContextPath()%>/dailyPartTimeIndex.do?currentPage=1'"
				class="paging">&lt;&lt;</button>
			<!-- 이전 페이지로 -->
			<button
				onclick="location.href='<%=request.getContextPath()%>/dailyPartTimeIndex.do?currentPage=<%=pi.getCurrentPage() - 1%>'"
				class="paging" id="beforeBtn">&lt;</button>
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
				onclick="location.href='<%=request.getContextPath()%>/dailyPartTimeIndex.do?currentPage=<%=p%>'"><%=p%></button>
			<%
				}
			%>
			<%
				}
			%>
			<!-- 다음 페이지로 -->
			<button
				onclick="location.href='<%=request.getContextPath()%>/dailyPartTimeIndex.do?currentPage=<%=pi.getCurrentPage() + 1%>'"
				class="paging" id="afterBtn">&gt;</button>
			<script>
            if(<%=pi.getCurrentPage()%> >= <%=pi.getMaxPage()%>){
               $('#afterBtn').prop('disabled', true);
            }
         </script>

			<!-- 맨 마지막으로 -->
			<button
				onclick="location.href='<%=request.getContextPath()%>/dailyPartTimeIndex.do?currentPage=<%=pi.getMaxPage()%>'"
				class="paging">&gt;&gt;</button>

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
				
				if('<%=loginUser%>' != 'null') {
					lorequest.getContextPath().getContextPath() %>
		/dailyDetail.bo?pi.getCurrentPage()+1;
								} else {
									alert('회원만 이용할 수 있는 서비스입니다. ')
								}

							})
		})
	</script>

	<%@ include file="../common/footer.jsp"%>
</body>
</html>