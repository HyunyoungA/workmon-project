<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%
	Member loginUser = (Member) session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워크몬</title>
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700"
	rel="stylesheet" type="text/css" />

<!-- Core theme CSS (includes Bootstrap)-->
<link href='<%=request.getContextPath()%>/css/styles.css'
	rel="stylesheet" type="text/css" />

<!-- 제이쿼리 -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
		<div class="container">

			<!-- logo 부분  -->
			<a class="navbar-brand" href="#page-top"><img
				src="<%=request.getContextPath()%>/img/navbar-logo.png" alt="..." /></a>
			<!-- logo end -->

			<!-- 상단바 창 너비 @media 쿼리 max 991px 일때 생기는 메뉴 버튼  -->
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<i class="fas fa-bars">11</i>
			</button>
			<!-- 상단바 메뉴 토글 버튼 end -->

			<!-- 상단바 1.네비게이션 메뉴, 2.로긴 메뉴 전체 감싼 div -->
			<div class="collapse navbar-collapse" id="navbarResponsive">

				<!-- 1.상단바 네이게이션 메뉴 부분 -->
				<ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">

					<!-- 일일알바 services css 수정 -->
					<li class="nav-item text-center"><a
						class="nav-link link_select_color1" href="#services">단기알바</a></li>

					<!-- 단기알바 services2 css 수정 -->
					<li class="nav-item text-center"><a
						class="nav-link link_select_color2" href="#services2">일일알바</a></li>
					<li class="nav-item text-center"><a
						class="nav-link link_select_color3" href="#portfolio">알바후기</a></li>

					<!-- 공지사항페이지로 이동 -->
					<li class="nav-item text-center"><a
						class="nav-link link_select_color4"
						href="<%=request.getContextPath()%>/notice_index.ho">공지사항</a></li>
				</ul>

				<!-- 2.상단바 로그인,회원가입 메뉴 리스트 -->
				<ul class="navbar-nav2 text-uppercase ms-auto py-lg-0">
					<!-- navbar-nav2는 css 따로만들어 줌  -->

					<!-- 로그인페이지로 넘어감 -->
					<%
						if (loginUser == null) {
					%>
					<li class="nav-item px-1"><a class="nav-link"
						href="<%=request.getContextPath()%>/loginForm.lf">로그인</a></li>

					<!-- 회원가입시 회원가입 개인,기업 선택 메뉴 창이 뜸 -->
					<li class="nav-item px-1"><a class="nav-link cursor"
						onclick="join_toggle();">회원가입</a></li>
					<%
						} else if (loginUser != null && loginUser.getUserTYPE() == 1) {
					%>

					<li class="nav-item px-1"><a class="nav-link cursor"
						href="<%=request.getContextPath()%>/indiMyPage.im">MYPAGE</a></li>

					<li class="nav-item px-1"><a class="nav-link cursor"
						href="<%=request.getContextPath()%>/logout.lo">LOGOUT</a></li>
					<%
						} else {
					%>
					<li class="nav-item px-1"><a class="nav-link cursor"
						href="<%=request.getContextPath()%>/compMyPage.cm">MYPAGE</a></li>

					<li class="nav-item px-1"><a class="nav-link cursor"
						href="<%=request.getContextPath()%>/logout.lo">LOGOUT</a></li>
					<%
						}
					%>
				</ul>
				<!-- 상단바 로그인,회원가입 리스트 end -->
			</div>
		</div>
	</nav>

	<!-- 회원가입 버튼 클릭시 나오는 회원가입 개인,기업 선택 부분 -->
	<div id="join_menu_out_bg">
		<div id="join_menu">
			<div id="join_menu_cancel_box">
				<img
					src="<%=request.getContextPath()%>/img/portfolio/join_cancel_icon.png"
					alt="취소버튼" align="right">
			</div>
			<div id="join_menu_logo_box"></div>
			<h4>회원가입 유형을 선택해주세요</h4>
			<div id="join_menu_content_box">
				<div id="join_menu_indi_box"
					onclick="location.href='<%=request.getContextPath()%>/indiJoinForm.ij'">
					<h6>개인회원</h6>
				</div>
				<div id="join_menu_comp_box"
					onclick="location.href='<%=request.getContextPath()%>/compJoinForm.cj'">
					<h6>기업회원</h6>
				</div>
			</div>
		</div>
	</div>
	<!-- 회원가입 메뉴 end -->


	<!-- 회원가입 메뉴 script -->
	<script type="text/javascript">
		function join_toggle() {
			var join_toggle = document.getElementById('join_menu_out_bg');
			join_toggle.style.display = 'block';
		}
		var cancel_butt = document.getElementById('join_menu_cancel_box');
		cancel_butt.onclick = function() {
			var join_toggle = document.getElementById('join_menu_out_bg');
			join_toggle.style.display = 'none';
		}
	</script>


	<!-- 메뉴 토글부분 -->
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/scripts.js"></script>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>