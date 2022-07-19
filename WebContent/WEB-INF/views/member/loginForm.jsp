<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워크몬</title>
<link href='<%=request.getContextPath()%>/css/loginForm.css'
	rel="stylesheet" type="text/css" />
<link href='<%=request.getContextPath()%>/css/joinSelectMini.css'
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- 회원가입 폼 중간정렬된 모든 태그들 감싸는 div -->
	<div id="wrapper_login">

		<div id="bax_border_layout">

			<!-- logo-img 부분 -->
			<div id="login_logo_wrap">
				<!-- 메인로고랑 좀 다름 -->
				<img
					src="<%= request.getContextPath() %>/img/portfolio/navbar-logo-black.png"
					width="250"
					onclick="location.href='<%= request.getContextPath() %>'">
			</div>
			<!-- logo end -->

			<!-- 기업, 개인 탭 부분 -->
			<div id="login_From_wrap">
				<div id="indi_mem_login_tap" class="check_login_Form_event"
					onclick="mem_click(this)">개인회원</div>
				<div id="comp_mem_login_tap" onclick="mem_click(this)">기업회원</div>
			</div>
			<!-- 탭 부분 end -->

			<!-- 기업,개인 input 창 부분 -->
			<div id="indi_comp_login_content_wrap">
				<form id="indi_login_content_box" class="flex_login_input"
					onsubmit="return false;">
					<input class="cccc" type="text" id="indiId" name="indiId"
						placeholder="개인 아이디" maxlength="15" title="아이디" /> <input
						class="cccc" type="password" id="indiPwd" name="indiPwd"
						placeholder="개인 비밀번호" maxlength="12" title="비밀번호" />
					<button type="submit" id="indiLogin">로그인</button>
					<p id="idText" style="display: none">아이디를 확인해 주세요</p>
					<p id="idText2" style="display: none">비밀번호를 확인해 주세요</p>
					<p id="idText3" style="display: none">아이디와 비밀번호를 확인해주세요!</p>
				</form>
				<form id="comp_login_content_box"
					class="flex_login_input check_login_input_event"
					onsubmit="return false;">
					<input type="text" id="compId" name="compId" placeholder="기업 아이디"
						maxlength="12" title="아이디" /> <input type="password" id="compPwd"
						name="compPwd" placeholder="기업 비밀번호" maxlength="12" title="비밀번호" />
					<button type="submit" id="compLogin">로그인</button>
					<p id="idText4" style="display: none">아이디를 확인해 주세요</p>
					<p id="idText5" style="display: none">비밀번호를 확인해 주세요</p>
					<p id="idText6" style="display: none">아이디와 비밀번호를 확인해주세요!</p>
				</form>
			</div>
			<!-- input 창 end -->

			<!-- 아이디,비번, 회원가입 메뉴 부분 -->
			<div id="id_pass_find_join_Wrap">
				<div>
					<a href="#">아이디 찾기 &nbsp;&nbsp;｜</a>
				</div>
				<div>
					<a href="#">비밀번호 찾기 &nbsp;&nbsp;｜</a>
				</div>
				<div class="margin_none">
					<a href="#" onclick="join_toggle();">회원가입</a>
				</div>
			</div>
			<!-- 아,비,회 메뉴 end -->

			<!-- 회원가입 버튼 클릭시 나오는 회원가입 개인,기업 선택 부분 -->
			<div id="join_menu_out_bg">
				<div id="join_menu">
					<div id="join_menu_cancel_box">
						<img
							src="<%= request.getContextPath() %>/img/portfolio/join_cancel_icon.png"
							alt="취소버튼" align="right">
					</div>
					<div id="join_menu_logo_box"></div>
					<h4>회원가입 유형을 선택해주세요</h4>
					<div id="join_menu_content_box">
						<div id="join_menu_indi_box"
							onclick="location.href='<%= request.getContextPath() %>/indiJoinForm.ij'">
							<h6>개인회원</h6>
						</div>
						<div id="join_menu_comp_box"
							onclick="location.href='<%= request.getContextPath() %>/compJoinForm.cj'">
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
                  join_toggle.style.display= 'block';
               }
               var cancel_butt = document.getElementById('join_menu_cancel_box');
                  cancel_butt.onclick = function() {
                   var join_toggle = document.getElementById('join_menu_out_bg');
                   join_toggle.style.display = 'none';
               }
           </script>
		</div>
	</div>
	<!-- 중간정렬된 모든 태그 end -->

	<!-- 회원가입 메뉴부분 js  -->
	<script type="text/javascript"
		src="<%= request.getContextPath() %>/js/scripts.js"></script>
	<script>
      
       $("#indiLogin").on("click",function(key){
          
           var userId = $('#indiId');
           var userPwd = $('#indiPwd');
           var indiForm = $('#indi_login_content_box')
           $tableBody = $('#indi_login_content_box')
           var idText = document.getElementById('idText');
           var idText2 = document.getElementById('idText2');
           var idText3 = document.getElementById('idText3');
           var indiId = document.getElementById('indiId');
           var indiPwd = document.getElementById('indiPwd');
         
           if(indiId.value.trim() != '' && indiPwd.value.trim() != '') {
              idText.style.display = 'none';
              idText2.style.display = 'none';
              $.ajax({
                    url: 'indiLogin.il',
                    type: 'post',
                    data: {inputId:userId.val(),inputPwd:userPwd.val()},
                    success: function(data){
                       
                       console.log(data);
                       if(data != 'null') {
                          console.log(data)
                        window.location.href = '<%= request.getContextPath()%>';
                        
                       }else {
                          console.log(data)
                          userpass = false;
                          indiForm.onsubmit = false;
                          idText3.style.display="block";
                       }
                    },
                    error: function(data){
                         alert('아이디와 비밀번호를 확인해주세요!');
                    }
                 })
           }else if(indiId.value.trim() == ''){
              idText3.style.display="none";
              idText2.style.display = 'none';
              indiId.focus();
            idText.style.display = 'block';
           }else if(indiPwd.value.trim() == ''){
              idText3.style.display="none";
              idText.style.display = 'none';
              indiPwd.focus();
              idText2.style.display = 'block';
           }
        });
       
       $("#compLogin").on("click",function(key){
          
              var userId = $('#compId');
              var userPwd = $('#compPwd');
              var indiForm = $('#comp_login_content_box')
              $tableBody = $('#comp_login_content_box')
              var idText4 = document.getElementById('idText4');
              var idText5 = document.getElementById('idText5');
              var idText6 = document.getElementById('idText6');
              var indiId = document.getElementById('compId');
            var indiPwd = document.getElementById('compPwd');

              if(indiId.value.trim() != '' && indiPwd.value.trim() != '') {
                 
                 idText4.style.display = 'none';
                 idText5.style.display = 'none';
                 $.ajax({
                       url: 'compLogin.cl',
                       type: 'post',
                       data: {inputId:userId.val(),inputPwd:userPwd.val()},
                       success: function(data){
                          
                          console.log(data);
                          if(data != 'null') {
                             console.log(data)
                           window.location.href = '<%= request.getContextPath()%>';
												} else {
													console.log(data)
													userpass = false;
													indiForm.onsubmit = false;
													idText6.style.display = "block";
												}
											},
											error : function(data) {
												alert('아이디와 비밀번호를 확인해주세요!');
											}
										})
							} else if (indiId.value.trim() == '') {
								idText6.style.display = "none";
								idText5.style.display = 'none';
								indiId.focus();
								idText4.style.display = 'block';
							} else if (indiPwd.value.trim() == '') {
								idText6.style.display = "none";
								idText4.style.display = 'none';
								indiPwd.focus();
								idText5.style.display = 'block';
							}
						});
	</script>
</body>
</html>