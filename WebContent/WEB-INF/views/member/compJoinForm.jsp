<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워크몬</title>
<link href='<%=request.getContextPath()%>/css/compJoinForm.css'
	rel="stylesheet" type="text/css" />
</head>
<body>
	<%@ include file="../common/navbarLink.jsp"%>
	<div id="notice_detail_wrap">
		<form action="<%=request.getContextPath()%>/compJoinInsert.cj"
			method="post" id="form_wrap" name="joinForm"
			onsubmit="return join_busi_butt()">
			<div class="form">
				<div class="title">
					<h1>기업회원 가입</h1>
				</div>
				<div id="form_wrap">
					<div id="idDiv">
						<div class="idClass" id="id">아이디</div>
						<input id="idIn" name="userId" class="empty_check" type="text"
							placeholder="6~16자 영문, 숫자" title="아이디" maxlength="16"
							onblur="focusOut1();"><br> <span class="Error"
							id="idError"></span>
					</div>
					<div class="pwdClass" id="pwd">비밀번호</div>
					<input id="pwdIn" name="userPwd" class="empty_check"
						type="password" placeholder="6~16자 영문, 숫자, 특수문자" title="비밀번호"
						maxlength="16" onblur="focusOut2();"><br> <span
						class="Error" id="pwdError"></span><br>
					<div class="pwdCheckClass" id="pwdCheck">비밀번호 확인</div>
					<input id="pwdCheckIn" class="empty_check" type="password"
						title="비밀번호확인" maxlength="16" onblur="focusOut3();"><br>
					<span class="Error" id="pwdCheckError"></span><br>
					<div class="phoneClass" id="phone">전화번호</div>
					<select class="phoneNumClass" name="phone1" id="phone1">
						<option selected>010</option>
						<option>011</option>
						<option>016</option>
						<option>017</option>
					</select> - <input class="phoneNumClass empty_check" name="phone2"
						id="phone2" type="text" size="3" maxlength="4" title="전화번호"
						oninput="this.value = this.value.replace(/[^0-9.]/g, '');"
						onblur="phoneCheck()"> - <input
						class="phoneNumClass empty_check" name="phone3" id="phone3"
						type="text" size="3" maxlength="4" title="전화번호"
						oninput="this.value = this.value.replace(/[^0-9.]/g, '');"
						onblur="phoneCheck()"><br> <span id="phoneError"></span><br>
					<div class="emailClass" id="email">이메일</div>
					<input id="emailIn" class="empty_check" type="text" title="이메일"
						name="email1"
						oninput="this.value = this.value.replace(/[^A-Za-z0-9]/g, '');"
						onblur="emailCheck()"> @ <input id="emailIn2"
						class="empty_check" type="text" title="도메인주소" name="email2"
						oninput="this.value = this.value.replace(/[^A-Za-z..]/g, '');"
						onblur="emailCheck()"> <select id="area"
						onChange="selectEmail(this)">
						<option value="" selected>선택하세요</option>
						<option value="naver.com">naver.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="nate.com">nate.com</option>
						<option value="daum.net">daum.net</option>
						<option value="hotmail.com">hotmail.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="0">직접 입력</option>
					</select><br> <span id="emailError"></span>
					<hr>
					<div class="businessClass" id="business">사업자등록번호</div>
					<input class="businessIn empty_check" id="business1"
						name="busiNum1" type="text" title="사업자번호" size="1" maxlength="3"
						oninput="this.value = this.value.replace(/[^0-9.]/g, '');"
						onblur="businessCheck()"> - <input
						class="businessIn empty_check" id="business2" name="busiNum2"
						type="text" title="사업자번호" size="3" maxlength="2"
						oninput="this.value = this.value.replace(/[^0-9.]/g, '');"
						onblur="businessCheck()"> - <input
						class="businessIn empty_check" id="business3" name="busiNum3"
						type="text" title="사업자번호" size="3" maxlength="5"
						oninput="this.value = this.value.replace(/[^0-9.]/g, '');"
						onblur="businessCheck()"><br> <span
						id="businessError"></span>
					<div class="text">※ 사업자등록번호 도용 방지를 위해 기업인증을 시행하고 있습니다.</div>
					<div class="text">※ 지점·지사의 경우, 해당 지점·지사의 사업자등록번호를 입력해 주세요.</div>
					<div class="text">※ 인증이 되지 않을 경우 고객센터(T.1588-9351)로 문의해 주세요.</div>
					<div class="companyClass" id="company">회사/점포명</div>
					<input id="companyIn" class="empty_check" name="companyName"
						type="text" title="회사/점포명" onblur="companyCheck()"><br>
					<span id="companyError"></span><br>
					<div class="leaderClass" id="leader">대표자명</div>
					<input id="leaderIn" class="empty_check" name="companyCEOName"
						type="text" title="대표자명" onblur="leaderCheck()"><br>
					<span id="leaderError"></span><br>
					<div class="addressClass" id="address">회사/점포주소</div>
					<input id="addressIn1" class="empty_check" name="companyAddress"
						type="text" title="회사/점포주소" onblur="addressCheck()"><br>
					<span id="addressError"></span><br>
					<hr>
					<div class="pathClass" id="path">어떤 경로로 알게 되었나요?</div>
					<select id="pathIn" name="route">
						<option value="">선택하세요</option>
						<option value="SNS">SNS</option>
						<option value="뉴스">뉴스</option>
						<option value="친구 및 지인소개">친구 및 지인소개</option>
						<option value="TV광고">TV광고</option>
						<option value="포털사이트 검색">포털사이트 검색</option>
						<option value="기타">기타</option>
					</select>
					<hr>
					<div class="form-group" id="divId"></div>
					<div id="buttonDiv">
						<button id="join">가입하기</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript">
		var dev_idchk = document.getElementById('idIn');
		var dev_pwd1 = document.getElementById('pwdIn');
		var dev_pwconfirm = document.getElementById('pwdCheckIn');
		var idError = document.getElementById('idError');
		var pwdError = document.getElementById('pwdError');
		var pwdCheckError = document.getElementById('pwdCheckError');
		var idRegExp = /^[a-zA-Z0-9]{6,16}$/;
		var pwdRegExp = /^[a-zA-Z0-9@$!%*?&]{6,16}$/;
		var pwdconfirmRegExp = /^[a-zA-Z0-9@$!%*?&]{6,16}$/;

		function focusOut1() {
			if (!idRegExp.test(dev_idchk.value)) {
				idError.innerHTML = "6~16자 영문, 숫자로 입력해야합니다";
				idError.style.color = "red";
				/* dev_idchk.focus(); */
			} else {
				idError.innerHTML = null;
				/* dev_idchk.next(); */
			}
		};

		function focusOut2() {
			if (!pwdRegExp.test(dev_pwd1.value)) {
				pwdError.innerHTML = "6~16자 영문, 숫자, 특수문자로 입력해야합니다";
				pwdError.style.color = "red";
				/* dev_pwd1.focus(); */
			} else {
				pwdError.innerHTML = null;
				/* dev_pwd1.next(); */
			}
		};

		function focusOut3() {
			if (dev_pwd1.value != dev_pwconfirm.value) {
				pwdCheckError.innerHTML = "비밀번호가 틀립니다. 다시 확인하여 입력해주세요.";
				pwdCheckError.style.color = "red";
				/* dev_pwconfirm.focus(); */
			} else {
				pwdCheckError.innerHTML = null;
				/* dev_pwconfirm.next(); */
			}
		};

		function selectEmail(ele) {
			var $ele = $(ele);
			var $email = $('input[name=email2]');
			// '1'인 경우 직접입력
			if ($ele.val() == "0") {
				$email.attr('readonly', false);
				$email.val('');
			} else {
				$email.attr('readonly', true);
				$email.val($ele.val());
			}
		}

		var phone2 = document.getElementById('phone2');
		var phone3 = document.getElementById('phone3');
		var phoneError = document.getElementById('phoneError');

		function phoneCheck() {
			if (phone2.value == '' || phone2.value.length == 0
					|| phone3.value == '' || phone3.value.length == 0) {
				phoneError.innerHTML = "필수 정보입니다."
				phoneError.style.color = "red";
			} else {
				phoneError.innerText = '';
				return true;
			}
		}

		var emailIn = document.getElementById('emailIn');
		var emailIn2 = document.getElementById('emailIn2');
		var emailError = document.getElementById('emailError');

		function emailCheck() {
			if (emailIn.value == '' || emailIn.value.length == 0
					|| emailIn2.value == '' || emailIn2.value.length == 0) {
				emailError.innerHTML = "필수 정보입니다."
				emailError.style.color = "red";
			} else {
				emailError.innerText = '';
				return true;
			}
		}

		var business1 = document.getElementById('business1');
		var business2 = document.getElementById('business2');
		var business3 = document.getElementById('business3');
		var businessError = document.getElementById('businessError');

		function businessCheck() {
			if (business1.value == '' || business1.value.length == 0
					|| business2.value == '' || business2.value.length == 0
					|| business3.value == '' || business3.value.length == 0) {
				businessError.innerHTML = "필수 정보입니다."
				businessError.style.color = "red";
			} else {
				businessError.innerText = '';
				return true;
			}
		}

		var companyIn = document.getElementById('companyIn');
		var companyError = document.getElementById('companyError');

		function companyCheck() {
			if (companyIn.value == '' || companyIn.value.length == 0) {
				companyError.innerHTML = "필수 정보입니다."
				companyError.style.color = "red";
			} else {
				companyError.innerText = '';
				return true;
			}
		}

		var leaderIn = document.getElementById('leaderIn');
		var leaderError = document.getElementById('leaderError');

		function leaderCheck() {
			if (leaderIn.value == '' || leaderIn.value.length == 0) {
				leaderError.innerHTML = "필수 정보입니다."
				leaderError.style.color = "red";
			} else {
				leaderError.innerText = '';
				return true;
			}
		}

		var addressIn1 = document.getElementById('addressIn1');
		var addressError = document.getElementById('addressError');

		function addressCheck() {
			if (addressIn1.value == '' || addressIn1.value.length == 0) {
				addressError.innerHTML = "필수 정보입니다."
				addressError.style.color = "red";
			} else {
				addressError.innerText = '';
				return true;
			}
		}
		//         가입하기 버튼 눌렀을 때 여부
		function join_busi_butt() {
			var route = document.getElementById('pathIn');
			var phone_number = document.getElementById('phone1');
			var empty_input_check = document
					.getElementsByClassName('empty_check');
			var UserPwd = document.getElementById('pwdIn');
			var UserPwd2 = document.getElementById('pwdCheckIn');
			console.log(UserPwd.value)
			console.log(UserPwd2.value)
			var empty_input_check = document
					.getElementsByClassName('empty_check');
			for (var i = 0; i < empty_input_check.length; i++) {
				if (empty_input_check[i].value.trim() == "") {
					alert(empty_input_check[i].title + "값을 입력해주세요");
					empty_input_check[i].focus();
					return false;
				} else if (route.value == "") {
					alert("워크몬을 알게 된 경로를 선택해주세요");
					route.focus();
					return false;
				} else if (phone_number.value == "") {
					alert("전화번호 앞자리를 선택해주세요")
					phone_number.focus();
					return false;
				} else if (UserPwd.value != UserPwd2.value) {
					alert("비밀번호가 일치하지 않습니다.")
					UserPwd2.focus();
					return false;
				}
			}
			
			
			if(UserCheck && IdCheck){//ajax아이디중복확인요청
	              return true;
	          } else{
	              alert('아이디 중복확인을 해주세요');
	              return false;
	          }
			return true
		}
		
		 //아이디 중복, 중복확인했는지
	      var UserCheck = false;
	      var IdCheck = false;
	      
	      $('#idIn').on('change paste keyup', function(){
	        IdChaeck = false; 
	      });
	      
	      $('#idIn').change(function(){
	        var userId = $('#idIn');
	        
	        if(!userId || userId.val().length < 6){
	           userId.focus();
	        } else{
	           $.ajax({
	              url: '<%=request.getContextPath()%>
		/checkId.no',
					type : 'post',
					data : {
						inputId : userId.val()
					},
					success : function(data) {
						console.log(data);
						if (data == '0') {
							$('#idError').text('사용 가능합니다.').css({
								'color' : 'green'
							});
							UserCheck = true;
							IdCheck = true;
						} else if (data == '1') {
							console.log('사용 불가능');
							$('#idError').text('사용 불가능합니다.').css({
								'color' : 'red'
							});
							UserCheck = false;
							IdCheck = false;
						}
					},
					error : function(data) {
						console.log(data);
					}
				})
			}
		});
	</script>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>