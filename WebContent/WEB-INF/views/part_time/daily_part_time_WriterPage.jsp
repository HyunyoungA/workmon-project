<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워크몬</title>
<link
	href='<%=request.getContextPath()%>/css/recruitmentWriterPage.css?ver=1'
	rel="stylesheet" type="text/css" />
</head>
<body>
	<%@ include file="../common/navbarLink.jsp"%>
	<div id="notice_detail_wrap">
		<form class="big"
			action="<%=request.getContextPath()%>/dailypartTimeJob.dt"
			method="post" encType="multipart/form-data"
			onsubmit="return compEmployCheck()">
			<h3>채용정보</h3>
			<hr>
			<br clear="all">
			<div class="readSumWrap_clear">
				<div class="secReadSummary">
					<div class="artReadJobSum">
						<div class="sumTit">
							<h3 class="hd_3">
								<%=loginUser.getCompanyName()%><input type="hidden"
									placeholder="기업을 입력해주세요." name="companyName"
									value="<%=loginUser.getCompanyName()%>" /> <br>
								<br> <input id="compTitleInput" class="empty_check"
									name="boardTitle" type="text" placeholder="타이틀을 입력해주세요."
									title="채용타이틀" />
							</h3>
						</div>
						<hr>
						<div class="tbRow_clear" style="max-width: 1000px;">
							<div class="tbCol">
								<h4 class="hd_4">지원자격</h4>
								<dl>
									<dt>경력</dt>
									<dt>
										<input type="text" name="career" class="empty_check"
											title="경력" />
									</dt>
								</dl>
								<dl>
									<dt>학력</dt>
									<dt>
										<input type="text" name="educationLevel" class="empty_check"
											title="학력" />
									</dt>
								</dl>
								<dl>
									<dt>우대</dt>
									<dt>
										<input type="text" name="prefer" />
									</dt>
								</dl>
							</div>
							<div class="tbCol">
								<h4 class="hd_4">근무조건</h4>
								<dl class="tbList">
									<dt>근무기간</dt>
									<dt>
										<input type="text" name="workPeriod" class="empty_check"
											title="근무시간" />
									</dt>
								</dl>
								<dl>
									<dt>급여</dt>
									<dt>
										<input type="text" name="salary" class="empty_check"
											title="급여" />
									</dt>
								</dl>
								<dl>
									<dt>지역</dt>
									<dt>
										<input type="text" name="area" class="empty_check" title="지역" />
									</dt>
								</dl>
							</div>
						</div>
						<br>
						<div>
							<div
								style="width: 100%; max-width: 1000px; min-height: 700px; max-height: auto;">
								<h6 style="height: 10px;">썸네일이미지를 넣어주세요</h6>
								<div id="titleImgArea"
									style="border-bottom: 0.5px solid gray; width: 100%; min-height: 340px; max-height: auto; border: 0.5px solid gray;">
									<img src="" id="titleImg" style="width: 100%; height: auto">
								</div>
								<h6 style="height: 10px;">채용공고 이미지를 넣어주세요</h6>
								<div id="EmployImgArea"
									style="width: 100%; min-height: 340px; max-height: auto; border: 0.5px solid gray;">
									<img src="" id="EmployImg" style="width: 100%; height: auto;">
								</div>
								<div id="fileArea">
									<input type="file" id="compLogo" name="compLogo"
										onchange="LoadImg(this,1)"> <input type="file"
										id="compEmployImg" name="compEmployImg"
										onchange="LoadImg(this,2)">
								</div>
								<script>
									// 내용 작성 부분의 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
									$(function() {
										$("#fileArea").hide();

										$("#titleImgArea").click(function() {
											$("#compLogo").click();
										});
										$("#EmployImgArea").click(function() {
											$("#compEmployImg").click();
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
												case 2:
													$("#EmployImg").attr("src",
															e.target.result);
													break;
												}
											}

											reader
													.readAsDataURL(value.files[0]); // 이건 파일ㅌ태그꺼
											//inpuyt type이 내가 어떤 데이터를 가져왔나 인지하게 만든다. 
										}
									}
								</script>
							</div>
						</div>
					</div>
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
										<input type="text" value="<%=loginUser.getCompanyName()%>">
									</dd>
									<dt>대표자명</dt>
									<dd>
										<input type="text" value="<%=loginUser.getUserId()%>">
									</dd>
									<dt>회사/점포주소</dt>
									<dd>
										<input type="text"
											value="<%=loginUser.getCompanyAddress()%>">
									</dd>
								</dl>
							</div>
						</div>
					</article>
				</div>
			</div>
			<div class="supportDiv">
				<button class="support" type="submit">작성하기</button>
				<input class="support" type="button"
					onclick="location.href='<%=request.getContextPath()%>/dailyPartTimeIndex.do'"
					value="취소하기">
			</div>

		</form>

	</div>
	<script>
		function compEmployCheck() {
			var empty_input_check = document
					.getElementsByClassName('empty_check');

			for (var i = 0; i < empty_input_check.length; i++) {
				if (empty_input_check[i].value.trim() == "") {
					alert(empty_input_check[i].title + "값을 입력해주세요");
					empty_input_check[i].focus();
					return false;
				}
			}

			return true;
		}
	</script>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>