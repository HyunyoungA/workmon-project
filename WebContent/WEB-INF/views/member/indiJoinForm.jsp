<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워크몬</title>
<link href='<%=request.getContextPath()%>/css/indiJoinForm.css'
	rel="stylesheet" type="text/css" />
</head>
<body>
	<%@ include file="../common/navbarLink.jsp"%>
	<div id="notice_detail_wrap">
		<div class="join">
			<h1>개인회원 가입</h1>
		</div>
		<div class="join">
			<form action="<%= request.getContextPath() %>/indiJoinInsert.ij"
				method="post" id="joinForm" name="joinForm"
				onsubmit="return join_butt()">
				<table>
					<tr>
						<td colspan="2" class="tLine"><div class="Line"></div></td>
					</tr>
					<tr>
						<td>아이디</td>
						<td class="round"><input type="text" name="UserId"
							id="dev_idchk" class="tBox_tPwd empty_check"
							placeholder="6~16자 영문, 숫자" title="아이디" onblur="focusOut1();"
							maxlength="16"><br> <span class="compul"
							id="UserId_chk"></span></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td class="round"><input type="password" name="UserPwd"
							id="dev_pwd1" class="tBox_tPwd empty_check"
							placeholder="6~16자 영문, 숫자, 특수문자" title="비밀번호"
							onblur="focusOut2();" maxlength="16"><br> <span
							class="compul" id='PwdSafeResult'></span></td>
					</tr>

					<tr>
						<td>비밀번호 확인</td>
						<td class="round"><input type="password" name="UserPwd2"
							id="dev_pwconfirm" class="tBox_tPwd empty_check" maxlength="16"
							title="비밀번호확인" onblur="focusOut3();" maxlength="16"><br>
							<span class="compul" id='dev_chk_pwd_confirm'></span></td>
					</tr>
					<tr>
						<td colspan="2" class="tLine"><div class="Line"></div></td>
					</tr>
					<tr>
						<td>이름</td>
						<td class="name_td"><input type="text" name="name"
							id="dev_name" class="tBox_tPwd empty_check" title="이름"
							onblur="nameCheck()"><br> <span id="nameError"></span>
						</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td class="email_td"><input type="text"
							class="email empty_check" name="email1" id="email_1" title="이메일"
							oninput="this.value = this.value.replace(/[^A-Za-z0-9]/g, '');"
							onblur="emailCheck()"> @ <input type="text" name="email2"
							class="email empty_check" id="email_2" title="도메인주소"
							oninput="this.value = this.value.replace(/[^A-Za-z..]/g, '');"
							onblur="emailCheck()"> <select class="email"
							id="email_name" onChange="selectEmail(this)">
								<option value="" selected>선택하세요</option>
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="nate.com">nate.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="gmail.com">gmail.com</option>
								<option value="hotmail.com">hotmail.com</option>
								<option value="0">직접입력</option>
						</select><br> <span id="emailError"></span></td>
					</tr>
					<tr>
						<td colspan="2" class="tLine"><div class="Line"></div></td>
					</tr>
					<tr>
						<td id="top">전화번호</td>
						<td class="phone_td"><select class="phone" id="phone_number"
							name="phone1">
								<option selected>010</option>
								<option>011</option>
								<option>016</option>
								<option>017</option>
						</select> - <input type="text" name="phone2" class="phone empty_check"
							id="phone1" title="휴대폰번호" size="3" maxlength="4"
							oninput="this.value = this.value.replace(/[^0-9.]/g, '');"
							onblur="phoneCheck()"> - <input type="text" name="phone3"
							class="phone empty_check" id="phone2" title="휴대폰번호" size="3"
							maxlength="4"
							oninput="this.value = this.value.replace(/[^0-9.]/g, '');"
							onblur="phoneCheck()"> <br> <span id="phoneError"></span>
							<!--                         <button type="submit" id="checkNumber">인증번호 받기</button><br> -->
							<!--                         <input type="text" id="check"> --> <!--                         <button type="submit" id="confirm">확인</button> -->
						</td>
					</tr>
					<tr>
						<td colspan="2" class="tLine"><div class="Line"></div></td>
					</tr>
					<tr>
						<td colspan="2">어떤 경로로 알게되었나요? <select id="route"
							name="route">
								<option value="">선택하세요</option>
								<option value="SNS">SNS</option>
								<option value="뉴스">뉴스</option>
								<option value="친구 및 지인소개">친구 및 지인소개</option>
								<option value="TV광고">TV광고</option>
								<option value="포털사이트 검색">포털사이트 검색</option>
								<option value="기타">기타</option>
						</select>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="tLine"><div class="Line"></div></td>
					</tr>

				</table>
				<div class="box">
					<button type="submit" id="join_1">가입하기</button>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		var dev_idchk = document.getElementById('dev_idchk');
		var dev_pwd1 = document.getElementById('dev_pwd1');
		var dev_pwconfirm = document.getElementById('dev_pwconfirm');
		var UserId_chk = document.getElementById('UserId_chk');
		var PwdSafeResult = document.getElementById('PwdSafeResult');
		var dev_chk_pwd_confirm = document
				.getElementById('dev_chk_pwd_confirm');
		var idRegExp = /^[a-zA-Z0-9]{6,16}$/;
		var pwdRegExp = /^[a-zA-Z0-9@$!%*?&]{6,16}$/;
		var pwdconfirmRegExp = /^[a-zA-Z0-9@$!%*?&]{6,16}$/;

		function focusOut1() {
			if (!idRegExp.test(dev_idchk.value)) {
				UserId_chk.innerHTML = "6~16자 영문, 숫자로 입력해야합니다";
				UserId_chk.style.color = "red";
				/* dev_idchk.focus(); */
			} else {
				UserId_chk.innerHTML = null;
				/* dev_idchk.next(); */
			}
		};

		function focusOut2() {
			if (!pwdRegExp.test(dev_pwd1.value)) {
				PwdSafeResult.innerHTML = "6~16자 영문, 숫자, 특수문자로 입력해야합니다";
				PwdSafeResult.style.color = "red";
				/* dev_pwd1.focus(); */
			} else {
				PwdSafeResult.innerHTML = null;
				/* dev_pwd1.next(); */
			}
		};

		function focusOut3() {
			if (dev_pwd1.value != dev_pwconfirm.value) {
				dev_chk_pwd_confirm.innerHTML = "비밀번호가 틀립니다. 다시 확인하여 입력해주세요.";
				dev_chk_pwd_confirm.style.color = "red";
				/* dev_pwconfirm.focus(); */
			} else {
				dev_chk_pwd_confirm.innerHTML = null;
				/* dev_pwconfirm.next(); */
			}
		};

		//     **이메일, 이름, 전화번호 확인
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

		var dev_name = document.getElementById('dev_name');
		var emailError = document.getElementById('emailError');

		function nameCheck() {
			if (dev_name.value == '' || dev_name.value.length == 0) {
				nameError.innerHTML = "필수 정보입니다."
				nameError.style.color = "red";
			} else {
				nameError.innerText = '';
				return true;
			}
		}

		var email_1 = document.getElementById('email_1');
		var email_2 = document.getElementById('email_2');
		var emailError = document.getElementById('emailError');

		function emailCheck() {
			if (email_1.value == '' || email_1.value.length == 0
					|| email_2.value == '' || email_2.value.length == 0) {
				emailError.innerHTML = "필수 정보입니다."
				emailError.style.color = "red";
			} else {
				emailError.innerText = '';
				return true;
			}
		}

		var phone1 = document.getElementById('phone1');
		var phone2 = document.getElementById('phone2');
		var phoneError = document.getElementById('phoneError');

		function phoneCheck() {
			if (phone1.value == '' || phone1.value.length == 0
					|| phone2.value == '' || phone2.value.length == 0) {
				phoneError.innerHTML = "필수 정보입니다."
				phoneError.style.color = "red";
			} else {
				phoneError.innerText = '';
				return true;
			}
		}

		//     가입하기 버튼 눌렀을 때 여부
		function join_butt() {
			var route = document.getElementById('route');
			var phone_number = document.getElementById('phone_number');
			var empty_input_check = document
					.getElementsByClassName('empty_check');
			var UserPwd = document.getElementById('dev_pwd1');
			var UserPwd2 = document.getElementById('dev_pwconfirm');

			for (var i = 0; i < empty_input_check.length; i++) {
				if (empty_input_check[i].value.trim() == "") {
					alert(empty_input_check[i].title + "값을 입력해주세요");
					empty_input_check[i].focus();
					return false;
				}
			}

			if (route.value == "") {
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

			if(UserCheck && IdCheck){//ajax아이디중복확인요청
	            return true;
	        } else{
	            alert('아이디 중복확인을 해주세요');
	            return false;
	        }
			
			return true;
		}
		
		
		
		 //아이디 중복, 중복확인했는지
	      var UserCheck = false;
	      var IdCheck = false;
	      
	      $('#dev_idchk').on('change paste keyup', function(){
	        IdChaeck = false; 
	      });
	      
	      $('#dev_idchk').change(function(){
	        var userId = $('#dev_idchk');
	        
	        if(!userId || userId.val().length < 6){
// 	           alert('6~16자 영문, 숫자로 입력해야합니다.');
	           userId.focus();
	        } else{
	           $.ajax({
	              url: '<%= request.getContextPath() %>
		/indiCheckId.no',
					type : 'post',
					data : {
						inputIndiId : userId.val()
					},
					success : function(data) {
						console.log(data);
						if (data == '0') {
							$('#UserId_chk').text('사용 가능합니다.').css({
								'color' : 'green'
							});
							UserCheck = true;
							IdCheck = true;
						} else if (data == '1') {
							console.log('사용 불가능');
							$('#UserId_chk').text('사용 불가능합니다.').css({
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