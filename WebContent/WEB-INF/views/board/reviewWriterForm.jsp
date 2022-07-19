<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<form action="<%=request.getContextPath()%>/reviewInsert.ho"
		method="post" encType="multipart/form-data"
		onsubmit="return blankCheck()">
		<div id="notice_detail_wrap">
			<div id="notice_flex_box">
				<div id="notice_part">
					<h2 id="page_top_title">알바 후기</h2>
				</div>
				<div id="notice_info_box">
					<input class="blankCheck" type="text" title="제목" name="title"
						placeholder="제목" />
				</div>
				<div id="notice_file_wrap">
					<table id="insertThumbTable"
						style="width: 100%; border: 1px solid;">
						<tr>
							<b>대표 이미지</b>
							<td colspan="3">
								<div title="대표 이미지" id="titleImgArea"
									style="width: 100%; min-height: 400px">
									<img id="titleImg" style="width: 100%; height: auto">
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
								reader.readAsDataURL(value.files[0]); // 이건 파일ㅌ태그꺼
								//inpuyt type이 내가 어떤 데이터를 가져왔나 인지하게 만든다. 

							}
						}
					</script>
				</div>

				<div id="notice_content_wrap">
					<textarea class="blankCheck" name="content" title="내용"
						placeholder="내용을 입력해주세요"></textarea>
				</div>

				<div id="notice_writer_butt_box">
					<input type="submit" id="insertBtn" value="작성하기" /> <input
						type="button" id="cancelBtn" value="취소하기"
						onclick="location.href='<%=request.getContextPath()%>/review_index.ho'" />
				</div>
			</div>
		</div>
	</form>
	<script>
	function blankCheck() {
        var blankCheck = document.getElementsByClassName('blankCheck');
        var titleImg = document.getElementById('titleImg');
      
        for (var i = 0; i < blankCheck.length; i++) {
           if (blankCheck[i].value.trim() == "") {
              alert(blankCheck[i].title + "값을 입력해주세요");
              blankCheck[i].focus();
              return false;
           }
        }
        
        console.log(titleImg.src == "");
        if(titleImg.src == "") {
           alert("대표 이미지를 등록해 주세요");
           return false;
        }
        return true;
     }
	</script>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>