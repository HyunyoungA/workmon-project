<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="part_time.model.vo.*, java.util.*, board.model.vo.*"%>
<%
	ArrayList<PartTime> boardlist1 = (ArrayList<PartTime>) request.getAttribute("boardlist1");
ArrayList<PartTime> boardlist2 = (ArrayList<PartTime>) request.getAttribute("boardlist2");
ArrayList<Board> boardlist3 = (ArrayList<Board>) request.getAttribute("boardlist3");

ArrayList<Image> filelist1 = (ArrayList<Image>) request.getAttribute("filelist1");
ArrayList<Image> filelist2 = (ArrayList<Image>) request.getAttribute("filelist2");
ArrayList<Attachment> filelist3 = (ArrayList<Attachment>) request.getAttribute("filelist3");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워크몬</title>

</head>
<body>
	<%@ include file="../common/navbar.jsp"%>
	<!-- 상단 배너 이미지 부분 전체 -->
	<header class="masthead">
		<div class="container">
			<div class="masthead-subheading ">급구 알바 다 있다~</div>
			<div class="masthead-subheading masthead-heading text-uppercase">workMon</div>
		</div>
	</header>
	<!-- 상단 배너 이미지 부분 end -->

	<!-- Services 아래 전체 content 부분~ -->
	<!-- 1. 단기알바 부분 section -->
	<section class="page-section bg-dark" id="services">
		<div class="container">

			<!-- 단기알바 컨텐츠 부분 텍스트 -->
			<div class="text-center">
				<h2 class="mb-5" style="color: white;">단기알바</h2>
			</div>
			<!-- 텍스트 end -->
			<%
				if (boardlist1.isEmpty()) {
			%>
			<a id="fileNull1"
				style="text-align: center; font-size: 20px; color: white; text-decoration: none; display: block;" href="<%=request.getContextPath()%>/shortPartTimeIndex.do">단기알바
				공고를 올려보세요!</a>
			<%
				} else {
			%>
			<!-- 단기알바 컨텐츠 flex 정렬을 위해 전체 감싸주는 div  -->
			<div class="row" id="size_chan_width">
				<!-- 단기알바 컨텐츠 리스트1번 -->
				<div class="col-lg-3 col-sm-6 mb-4">
					<div class="portfolio-item">
						<div class="wrap_content portfolio-caption2">
							<img class="img-fluid border-radius_top"
								src="<%for (int i = 0; filelist1.size() > i; i++) {
	if (i == 1) {
		break;
	}
	if (!filelist1.isEmpty() && filelist1 != null) {%><%=request.getContextPath()%>/img_uploadFiles/<%=filelist1.get(i).getReName()%><%}
}%>"
								alt="..." />
						</div>
						<div class="portfolio-caption border-radius_bottom">
							<%
								for (int i = 0; boardlist1.size() > i; i++) {
							%>
							<%
								if (i == 1) {
								break;
							}
							if (!boardlist1.isEmpty() && boardlist1 != null) {
							%>
							<h4 class="mb-4"><%=boardlist1.get(i).getCompanyName()%></h4>
							<p class="mb-2"><%=boardlist1.get(i).getBoardTitle()%></p>
							<p class="mb-4"><%=boardlist1.get(i).getSalary()%></p>
							<%
								if (loginUser != null) {
							%>
							<button type="button" class="btn text-dark btn-hover"
								onclick="location.href='<%=request.getContextPath()%>/shortDetail.bo?bId=<%=boardlist1.get(i).getBoardNum()%>'">지원하기</button>
							<%
								} else {
							%>
							<button type="button" class="btn text-dark btn-hover">지원하기</button>
							<%
								}
							%>
							<%
								}
							%>
							<%
								}
							%>
						</div>
					</div>
				</div>
				<!-- 리스트1번 end -->

				<!-- 단기알바 컨텐츠 리스트2번 -->
				<div class="col-lg-3 col-sm-6 mb-4">
					<div class="portfolio-item">
						<div class="wrap_content portfolio-caption2">
							<img class="img-fluid border-radius_top"
								src="<%for (int i = 1; filelist1.size() > i; i++) {
	if (i == 2) {
		break;
	}
	if (!filelist1.isEmpty() && filelist1 != null) {%><%=request.getContextPath()%>/img_uploadFiles/<%=filelist1.get(i).getReName()%><%}
}%>"
								alt="..." />
						</div>
						<div class="portfolio-caption border-radius_bottom">
							<%
								for (int i = 1; boardlist1.size() > i; i++) {
							%>
							<%
								if (i == 2) {
								break;
							}
							if (!boardlist1.isEmpty() && boardlist1 != null) {
							%>
							<h4 class="mb-4"><%=boardlist1.get(i).getCompanyName()%></h4>
							<p class="mb-2"><%=boardlist1.get(i).getBoardTitle()%></p>
							<p class="mb-4"><%=boardlist1.get(i).getSalary()%></p>
							<%
								if (loginUser != null) {
							%>
							<button type="button" class="btn text-dark btn-hover"
								onclick="location.href='<%=request.getContextPath()%>/shortDetail.bo?bId=<%=boardlist1.get(i).getBoardNum()%>'">지원하기</button>
							<%
								} else {
							%>
							<button type="button" class="btn text-dark btn-hover">지원하기</button>
							<%
								}
							%>
							<%
								}
							%>
							<%
								}
							%>
						</div>
					</div>
				</div>
				<!-- 리스트2번 end -->

				<!-- 단기알바 컨텐츠 리스트3번 -->
				<div class="col-lg-3 col-sm-6 mb-4">
					<div class="portfolio-item">
						<div class="wrap_content portfolio-caption2">
							<img class="img-fluid border-radius_top"
								src="<%for (int i = 2; filelist1.size() > i; i++) {
	if (i == 3) {
		break;
	}
	if (!filelist1.isEmpty() && filelist1 != null) {%><%=request.getContextPath()%>/img_uploadFiles/<%=filelist1.get(i).getReName()%><%}
}%>"
								alt="..." />
						</div>
						<div class="portfolio-caption border-radius_bottom">
							<%
								for (int i = 2; boardlist1.size() > i; i++) {
							%>
							<%
								if (i == 3) {
								break;
							}
							if (!boardlist1.isEmpty() && boardlist1 != null) {
							%>
							<h4 class="mb-4"><%=boardlist1.get(i).getCompanyName()%></h4>
							<p class="mb-2"><%=boardlist1.get(i).getBoardTitle()%></p>
							<p class="mb-4"><%=boardlist1.get(i).getSalary()%></p>
							<%
								if (loginUser != null) {
							%>
							<button type="button" class="btn text-dark btn-hover"
								onclick="location.href='<%=request.getContextPath()%>/shortDetail.bo?bId=<%=boardlist1.get(i).getBoardNum()%>'">지원하기</button>
							<%
								} else {
							%>
							<button type="button" class="btn text-dark btn-hover">지원하기</button>
							<%
								}
							%>
							<%
								}
							%>
							<%
								}
							%>
						</div>
					</div>
				</div>
				<!-- 리스트3번 end -->

				<!-- 단기알바 컨텐츠 리스트4번 -->
				<div class="col-lg-3 col-sm-6 mb-4 mb-lg-0">
					<div class="portfolio-item">
						<div class="wrap_content portfolio-caption3">
							<h3 class="cursor"
								onclick="location.href='<%=request.getContextPath()%>/shortPartTimeIndex.do'">+</h3>
						</div>
					</div>
				</div>
				<!-- 리스트4번 end -->

			</div>
			<!-- 단기알바 컨텐츠 flex 정렬을 위해 전체 감싸주는 div - end  -->
			<%
				}
			%>
		</div>
	</section>
	<!-- 1. 단기알바 부분 section - end -->

	<!-- 2. 일일알바 부분 section -->
	<section class="page-section bg-light" id="services2">
		<div class="container">

			<!-- 일일알바 컨텐츠 부분 텍스트 -->
			<div class="text-center">
				<h2 class="mb-5">일일알바</h2>
			</div>
			<!-- 텍스트 end -->

			<!-- 일일알바 컨텐츠 flex 정렬을 위해 전체 감싸주는 div  -->
			<%
				if (filelist2.isEmpty()) {
			%>
			<a id="fileNull" style="text-align: center; font-size: 20px; color:black; text-decoration: none; display: block;" href="<%=request.getContextPath()%>/dailyPartTimeIndex.do">일일알바
				공고를 올려보세요!</a>
			<%
				} else {
			%>
			<div id="flex_list_Box" class="row" id="size_chan_width">

				<!-- 일일알바 컨텐츠 리스트1번 -->
				<div class="col-lg-3 col-sm-6 mb-4">
					<div class="portfolio-item">
						<div class="wrap_content portfolio-caption2">
							<img class="img-fluid border-radius_top"
								src="<%for (int i = 0; filelist2.size() > i; i++) {
	if (i == 1) {
		break;
	}
	if (!filelist2.isEmpty() && filelist2 != null) {%><%=request.getContextPath()%>/img_uploadFiles/<%=filelist2.get(i).getReName()%><%}
}%>"
								alt="..." />
						</div>
						<div class="portfolio-caption border-radius_bottom">
							<%
								for (int i = 0; boardlist2.size() > i; i++) {
							%>
							<%
								if (i == 1) {
								break;
							}
							if (!boardlist2.isEmpty() && boardlist2 != null) {
							%>
							<h4 class="mb-4"><%=boardlist2.get(i).getCompanyName()%></h4>
							<p class="mb-2"><%=boardlist2.get(i).getBoardTitle()%></p>
							<p class="mb-4"><%=boardlist2.get(i).getSalary()%></p>
							<%
								if (loginUser != null) {
							%>
							<button type="button" class="btn text-dark btn-hover"
								onclick="location.href='<%=request.getContextPath()%>/shortDetail.bo?bId=<%=boardlist2.get(i).getBoardNum()%>'">지원하기</button>
							<%
								} else {
							%>
							<button type="button" class="btn text-dark btn-hover">지원하기</button>
							<%
								}
							%>
							<%
								}
							%>
							<%
								}
							%>
						</div>
					</div>
				</div>
				<!-- 리스트2번 end -->

				<!-- 일일알바 컨텐츠 리스트2번 -->
				<div class="col-lg-3 col-sm-6 mb-4">
					<div class="portfolio-item">
						<div class="wrap_content portfolio-caption2">
							<img class="img-fluid border-radius_top"
								src="<%for (int i = 1; filelist2.size() > i; i++) {
	if (i == 2) {
		break;
	}
	if (!filelist2.isEmpty() && filelist2 != null) {%><%=request.getContextPath()%>/img_uploadFiles/<%=filelist2.get(i).getReName()%><%}
}%>"
								alt="..." />
						</div>
						<div class="portfolio-caption border-radius_bottom">
							<%
								for (int i = 1; boardlist2.size() > i; i++) {
							%>
							<%
								if (i == 2) {
								break;
							}
							if (!boardlist2.isEmpty() && boardlist2 != null) {
							%>
							<h4 class="mb-4"><%=boardlist2.get(i).getCompanyName()%></h4>
							<p class="mb-2"><%=boardlist2.get(i).getBoardTitle()%></p>
							<p class="mb-4"><%=boardlist2.get(i).getSalary()%></p>
							<%
								if (loginUser != null) {
							%>
							<button type="button" class="btn text-dark btn-hover"
								onclick="location.href='<%=request.getContextPath()%>/shortDetail.bo?bId=<%=boardlist2.get(i).getBoardNum()%>'">지원하기</button>
							<%
								} else {
							%>
							<button type="button" class="btn text-dark btn-hover">지원하기</button>
							<%
								}
							%>
							<%
								}
							%>
							<%
								}
							%>
						</div>
					</div>
				</div>
				<!-- 리스트3번 end -->

				<!-- 일일알바 컨텐츠 리스트3번 -->
				<div class="col-lg-3 col-sm-6 mb-4">
					<div class="portfolio-item">
						<div class="wrap_content portfolio-caption2">
							<img class="img-fluid border-radius_top"
								src="<%for (int i = 2; filelist2.size() > i; i++) {
	if (i == 3) {
		break;
	}
	if (!filelist2.isEmpty() && filelist2 != null) {%><%=request.getContextPath()%>/img_uploadFiles/<%=filelist2.get(i).getReName()%><%}
}%>"
								alt="..." />
						</div>
						<div class="portfolio-caption border-radius_bottom">
							<%
								for (int i = 2; boardlist2.size() > i; i++) {
							%>
							<%
								if (i == 3) {
								break;
							}
							if (!boardlist2.isEmpty() && boardlist2 != null) {
							%>
							<h4 class="mb-4"><%=boardlist2.get(i).getCompanyName()%></h4>
							<p class="mb-2"><%=boardlist2.get(i).getBoardTitle()%></p>
							<p class="mb-4"><%=boardlist2.get(i).getSalary()%></p>
							<%
								if (loginUser != null) {
							%>
							<button type="button" class="btn text-dark btn-hover"
								onclick="location.href='<%=request.getContextPath()%>/shortDetail.bo?bId=<%=boardlist2.get(i).getBoardNum()%>'">지원하기</button>
							<%
								} else {
							%>
							<button type="button" class="btn text-dark btn-hover">지원하기</button>
							<%
								}
							%>
							<%
								}
							%>
							<%
								}
							%>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6 mb-4 mb-lg-0">
					<div class="portfolio-item">
						<div class="wrap_content portfolio-caption3">
							<h3 class="cursor"
								onclick="location.href='<%=request.getContextPath()%>/dailyPartTimeIndex.do'">+</h3>
						</div>
					</div>
				</div>
				<!-- 리스트4번 end -->

			</div>
			<!-- 일일알바 컨텐츠 flex 정렬을 위해 전체 감싸주는 div - end  -->

			<%
				}
			%>
		</div>
	</section>
	<!-- 2. 일일알바 부분 section - end -->


	<section class="page-section bg-dark" id="portfolio">
		<div class="container">

			<!-- 알바후기 컨텐츠 부분 텍스트 -->
			<div class="text-center">
				<h2 class="mb-5" style="color: white;">알바후기</h2>
			</div>
			<!-- 텍스트 end -->
			<%
				if (filelist3.isEmpty()) {
			%>
			<a id="fileNull3"
				style="text-align: center; font-size: 20px; color: white; text-decoration: none; display: block;" href="<%=request.getContextPath()%>/review_index.ho">알바후기를
				올려보세요!</a>
			<%
				} else {
			%>
			<!-- 알바후기 컨텐츠 flex 정렬을 위해 전체 감싸주는 div  -->
			<div class="row" id="size_chan_width">
				<!-- 알바후기 컨텐츠 리스트1번 -->
				<div class="col-lg-6 col-sm-6 mb-4">
					<div class="portfolio-item portfolio-list_top">
						<div class="wrap_content portfolio-caption2">
							<img class="img-fluid"
								src="<%for (int i = 0; filelist3.size() > i; i++) {
	if (i == 1) {
		break;
	}
	if (!filelist3.isEmpty() && filelist3 != null) {%><%=request.getContextPath()%>/img_uploadFiles/<%=filelist3.get(i).getChangeName()%><%}
}%>"
								alt="..." />
						</div>
						<%
							for (int i = 0; boardlist3.size() > i; i++) {
						%>
						<%
							if (i == 1) {
							break;
						}
						if (!boardlist3.isEmpty() && boardlist3 != null) {
						%>
						<%
							if (loginUser != null) {
						%>
						<div class="portfolio-caption"
							onclick="location.href='<%=request.getContextPath()%>/reviewDetail.bo?bId=<%=boardlist3.get(i).getBoardNum()%>'">
							<%
								} else {
							%>
							<div class="portfolio-caption" style="padding: 1rem;">
								<%
									}
								%>
								<h4 class="mb-4 ms-4"
									style="width: 80%; height: 25px; overflow: hidden"><%=boardlist3.get(i).getBoardTitle()%></h4>
								<p class="mb-2 ms-4"
									style="height: 25px; width: 80%; overflow: hidden"><%=boardlist3.get(i).getBoardContent()%></p>
							</div>
							<%
								}
							%>
							<%
								}
							%>

						</div>
					</div>
					<!-- 리스트2번 end -->

					<!-- 알바후기 컨텐츠 리스트2번 -->
					<div class="col-lg-6 col-sm-6 mb-4">
						<div class="portfolio-item portfolio-list_top">
							<div class="wrap_content portfolio-caption2">
								<img class="img-fluid"
									src="<%for (int i = 1; filelist3.size() > i; i++) {
	if (i == 2) {
		break;
	}
	if (!filelist3.isEmpty() && filelist3 != null) {%><%=request.getContextPath()%>/img_uploadFiles/<%=filelist3.get(i).getChangeName()%><%}
}%>"
									alt="..." />
							</div>
							<%
								for (int i = 1; boardlist3.size() > i; i++) {
							%>
							<%
								if (i == 2) {
								break;
							}
							if (!boardlist3.isEmpty() && boardlist3 != null) {
							%>
							<%
								if (loginUser != null) {
							%>
							<div class="portfolio-caption"
								onclick="location.href='<%=request.getContextPath()%>/reviewDetail.bo?bId=<%=boardlist3.get(i).getBoardNum()%>'">
								<%
									} else {
								%>
								<div class="portfolio-caption" style="padding: 1rem;">
									<%
										}
									%>
									<h4 class="mb-4 ms-4"
										style="width: 80%; height: 25px; overflow: hidden"><%=boardlist3.get(i).getBoardTitle()%></h4>
									<p class="mb-2 ms-4"
										style="height: 25px; width: 80%; overflow: hidden"><%=boardlist3.get(i).getBoardContent()%></p>
								</div>
								<%
									}
								%>
								<%
									}
								%>
							</div>
						</div>
						<!-- 리스트2번 end -->

						<!-- 알바후기 컨텐츠 리스트3번 -->
						<div class="col-lg-4 col-sm-6 mb-4">
							<div class="portfolio-item">
								<div
									class="wrap_content portfolio-caption2 portfolio-bottom_list">
									<img class="img-fluid"
										src="<%for (int i = 2; filelist3.size() > i; i++) {
	if (i == 3) {
		break;
	}
	if (!filelist3.isEmpty() && filelist3 != null) {%><%=request.getContextPath()%>/img_uploadFiles/<%=filelist3.get(i).getChangeName()%><%}
}%>"
										alt="..." />
								</div>
								<%
									for (int i = 2; boardlist3.size() > i; i++) {
								%>
								<%
									if (i == 3) {
									break;
								}
								if (!boardlist3.isEmpty() && boardlist3 != null) {
								%>
								<%
									if (loginUser != null) {
								%>
								<div class="portfolio-caption"
									onclick="location.href='<%=request.getContextPath()%>/reviewDetail.bo?bId=<%=boardlist3.get(i).getBoardNum()%>'">
									<%
										} else {
									%>
									<div class="portfolio-caption" style="padding: 1rem;">
										<%
											}
										%>
										<h4 class="mb-4 ms-4"
											style="width: 80%; height: 25px; overflow: hidden"><%=boardlist3.get(i).getBoardTitle()%></h4>
										<p class="mb-2 ms-4"
											style="height: 25px; width: 80%; overflow: hidden"><%=boardlist3.get(i).getBoardContent()%></p>
									</div>
									<%
										}
									%>
									<%
										}
									%>
								</div>
							</div>
							<!-- 리스트3번 end -->

							<!-- 알바후기 컨텐츠 리스트4번 -->
							<div class="col-lg-4 col-sm-6 mb-4">
								<div class="portfolio-item ">
									<div
										class="wrap_content portfolio-caption2 portfolio-bottom_list">
										<img class="img-fluid"
											src="<%for (int i = 3; filelist3.size() > i; i++) {
	if (i == 4) {
		break;
	}
	if (!filelist3.isEmpty() && filelist3 != null) {%><%=request.getContextPath()%>/img_uploadFiles/<%=filelist3.get(i).getChangeName()%><%}
}%>"
											alt="..." />
									</div>
									<%
										for (int i = 3; boardlist3.size() > i; i++) {
									%>
									<%
										if (i == 4) {
										break;
									}
									if (!boardlist3.isEmpty() && boardlist3 != null) {
									%>
									<%
										if (loginUser != null) {
									%>
									<div class="portfolio-caption"
										onclick="location.href='<%=request.getContextPath()%>/reviewDetail.bo?bId=<%=boardlist3.get(i).getBoardNum()%>'">
										<%
											} else {
										%>
										<div class="portfolio-caption" style="padding: 1rem;">
											<%
												}
											%>
											<h4 class="mb-4 ms-4"
												style="width: 80%; height: 25px; overflow: hidden"><%=boardlist3.get(i).getBoardTitle()%></h4>
											<p class="mb-2 ms-4"
												style="height: 25px; width: 80%; overflow: hidden"><%=boardlist3.get(i).getBoardContent()%></p>
										</div>
										<%
											}
										%>
										<%
											}
										%>
									</div>
								</div>
								<!-- 리스트4번 end -->

								<!-- 알바후기 컨텐츠 리스트5번 -->
								<div class="col-lg-4 col-sm-6 mb-4 mb-lg-0">
									<div class="portfolio-item">
										<div class="wrap_content portfolio-caption4">
											<h3 class="cursor"
												onclick="location.href='<%=request.getContextPath()%>/review_index.ho'">+</h3>
										</div>
									</div>
								</div>
								<!-- 리스트5번 end -->

							</div>
							<!-- 알바후기 컨텐츠 flex 정렬을 위해 전체 감싸주는 div - end  -->
						</div>
					</div>
				</div>
			</div>
			<%
				}
			%>
		</div>
	</section>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>