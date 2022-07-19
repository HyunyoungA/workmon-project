<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="part_time.model.vo.*, java.util.*"%>
<%
	PartTime p = (PartTime)request.getAttribute("partTime");
	ArrayList<Image> imgList = (ArrayList<Image>)request.getAttribute("imgList");
	Member company = (Member)request.getAttribute("company");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워크몬</title>
<link
	href='<%=request.getContextPath()%>/css/short_part_time_Detail.css'
	rel="stylesheet" type="text/css" />
</head>
<body>
	<%@ include file="../common/navbarLink.jsp"%>
	<form id="notice_detail_wrap"
		action="<%= request.getContextPath()%>/shortUpdate.su" method="post">
		<div class="big">

			<div style="position: relative;">
				<h3>채용정보</h3>
				<% if(p.getUserId().equals(loginUser.getUserId()) && loginUser != null){ %><input
					type="submit" id="recruit_modify"
					style="position: absolute; right: 0; top: 0; border: none; background: transparent; cursor: pointer; text-align: right"
					value="수정하기">
				<% } %>
			</div>
			<input type="hidden" name="boardNum" id="boardNum"
				value="<%= p.getBoardNum()%>">
			<hr>
			<br clear="all">
			<div class="readSumWrap_clear">
				<div class="secReadSummary">
					<article class="artReadJobSum">
						<div class="sumTit">
							<h3 class="hd_3">
								<div class="header">
									<span class="coName"><%= p.getCompanyName() %><input
										type="hidden" name="companyName"
										value="<%= p.getCompanyName() %>"></span>
								</div>
								<%= p.getBoardTitle() %><input type="hidden" name="boardTitle"
									value="<%= p.getBoardTitle() %>">
							</h3>
						</div>
						<hr>
						<div class="tbRow_clear">
							<div class="tbCol">
								<h4 class="hd_4">지원자격</h4>
								<dl>
									<dt>경력</dt>
									<dt>
										<strong class="col_1"><%= p.getCareer() %><input
											type="hidden" name="career" value="<%= p.getCareer() %>"></strong>
									</dt>
								</dl>
								<dl>
									<dt>학력</dt>
									<dt>
										<strong class="col_1"><%= p.getEducationLevel() %><input
											type="hidden" name="educationLevel"
											value="<%= p.getEducationLevel() %>"></strong>
									</dt>
								</dl>
								<dl>
									<dt>우대</dt>
									<dt>
										<strong class="col_1"><%= p.getPrefer() %><input
											type="hidden" name="prefer" value="<%= p.getPrefer() %>"></strong>
									</dt>
								</dl>
							</div>
							<div class="tbCol">
								<h4 class="hd_4">근무조건</h4>
								<dl class="tbList">
									<dt>근무기간</dt>
									<dt>
										<strong class="col_1"><%= p.getWorkPeriod() %><input
											type="hidden" name="workPeriod"
											value="<%= p.getWorkPeriod() %>"></strong>
									<dt>
								</dl>
								<dl>
									<dt>급여</dt>
									<dt>
										<em class="dotum"><%= p.getSalary() %><input
											type="hidden" name="salary" value="<%= p.getSalary() %>"></em>
									<dt>
								</dl>
								<dl>
									<dt>지역</dt>
									<dd><%= p.getArea() %><input type="hidden" name="area"
											value="<%= p.getArea() %>">
									</dd>
								</dl>
							</div>
						</div>
						<br>
						<div>
							<div style="border: 1px solid black; width: 100%; height: auto;">
								<img id="img_section" style="width: 100%; height: auto;"
									src="<% if( !imgList.isEmpty() && imgList != null){ %><%= request.getContextPath() %>/img_uploadFiles/<%= imgList.get(0).getReName() %><% } %>">
							</div>
						</div>
					</article>
				</div>
			</div>
			<div>
				<div id="tab05" class="secReadConInfo">
					<h4 class="hd_2">기업정보</h4>
					<hr>
					<br clear="all">
					<article class="artReadConInfo divReadBx">
						<div class="tbRow_clear_1">
							<div class="tbCol_coInfo">
								<dl class="tbList_1">
									<dt>회사/점포명</dt>
									<dd>
										<%= company.getCompanyName() %><input type="hidden"
											value="<%= company.getCompanyName() %>">
									</dd>
									<dt>대표자명</dt>
									<dd>
										<%= company.getUserId() %><input type="hidden"
											value="<%= company.getUserId() %>">
									</dd>
									<dt>회사/점포주소</dt>
									<dd>
										<%= company.getCompanyAddress() %><input type="hidden"
											value="<%= company.getCompanyAddress() %>">
									</dd>
								</dl>
							</div>
						</div>
					</article>
				</div>
			</div>
			<div class="supportDiv">
				<% if(loginUser.getUserTYPE() == 1 && loginUser != null){ %>
				<button type="button" class="support" onclick="submitUser();">지원하기</button>
				<% } %>
				<% if((p.getUserId().equals(loginUser.getUserId()) || loginUser.getUserId().equals("admin00")) && loginUser != null){ %>
				<button type="button" class="support" id="drop">삭제하기</button>
				<% } %>
			</div>
		</div>
	</form>
	<script>
	       $(function(){
				$('#drop').click(function() {
					var bId = $('#boardNum').val();
						location.href = '<%= request.getContextPath() %>/shortPartTimeDelete.sd?bId=' + bId;	
				})
			})
			
			function submitUser() {
	    	   alert('지원을 완료하셨습니다');
	    	   location.href='<%= request.getContextPath() %>
		';
		}
	</script>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>