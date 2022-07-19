<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%
	Member member = (Member) request.getAttribute("loginUser");

String[] phone = member.getUserPhone().split("-");
String phoneCheck = phone[0];
String phone2 = phone[1];
String phone3 = phone[2];

String[] email = member.getUserEmail().split("@");
String email1 = email[0];
String emailCheck = email[1];

String[] phone1 = new String[4];
switch (phoneCheck) {
	case "010" :
		phone1[0] = "selected";
		break;
	case "011" :
		phone1[1] = "selected";
		break;
	case "016" :
		phone1[2] = "selected";
		break;
	case "017" :
		phone1[3] = "selected";
		break;
}

String[] route = new String[7];
switch (member.getJoinPath()) {
	case "SNS" :
		route[0] = "selected";
		break;
	case "뉴스" :
		route[1] = "selected";
		break;
	case "친구 및 지인소개" :
		route[2] = "selected";
		break;
	case "TV광고" :
		route[3] = "selected";
		break;
	case "포털사이트 검색" :
		route[4] = "selected";
		break;
	case "기타" :
		route[5] = "selected";
		break;
	default :
		route[6] = "selected";
}

String[] email2 = new String[7];
switch (emailCheck) {
	case "naver.com" :
		email2[0] = "selected";
		break;
	case "daum.net" :
		email2[1] = "selected";
		break;
	case "nate.com" :
		email2[2] = "selected";
		break;
	case "hanmail.net" :
		email2[3] = "selected";
		break;
	case "gmail.com" :
		email2[4] = "selected";
		break;
	case "hotmail.com" :
		email2[5] = "selected";
		break;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워크몬</title>
<link href='<%=request.getContextPath()%>/css/indiMyPage.css'
	rel="stylesheet" type="text/css" />
</head>
<body>
	<%@ include file="../common/navbarLink.jsp"%>
	<div id="notice_detail_wrap">
		<div class="mypage">
			<h1>My Page</h1>
		</div>
		<div class="mypage">
			<form action="<%=request.getContextPath()%>/indiMyUpdateInsert.iu"
				method="post" onsubmit="return indiUpdate_butt()">
				<table>
					<tr>
						<td colspan="2" class="tLine"><div class="Line"></div></td>
					</tr>
					<tr>
						<td>아이디</td>
						<td style="padding-left: 20px;"><%=member.getUserId()%><input
							type="hidden" name="indiMyUserId" class="tBox_tPwd"
							placeholder="readonly 해놓은 상태" title="아이디" readonly
							value="<%=member.getUserId()%>"></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td class="round"><input type="password" name="indiMyUserPwd"
							id="dev_pwd1" class="tBox_tPwd empty_check"
							placeholder="6~16자 영문, 숫자, 특수문자" title="비밀번호"
							onblur="focusOut2();" maxlength="16"><br> <span
							class="compul" id='PwdSafeResult'></span></td>
					</tr>

					<tr>
						<td>비밀번호 확인</td>
						<td class="round"><input type="password"
							name="indiMyUserPwd2" id="dev_pwconfirm"
							class="tBox_tPwd empty_check" maxlength="16" title="비밀번호확인"
							onblur="focusOut3();" maxlength="16"><br> <span
							class="compul" id='dev_chk_pwd_confirm'></span></td>
					</tr>
					<tr>
						<td colspan="2" class="tLine"><div class="Line"></div></td>
					</tr>
					<tr>
						<td>이름</td>
						<td class="name_td"><input type="text" name="indiMyName"
							id="dev_name" class="tBox_tPwd empty_check" title="이름"
							onblur="nameCheck()" value="<%=member.getUserName()%>"><br>
							<span id="nameError"></span></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="text" class="email empty_check"
							name="indiMyEmail1" id="email_1" title="이메일"
							oninput="this.value = this.value.replace(/[^A-Za-z0-9]/g, '');"
							onblur="emailCheck()" value="<%=email1%>"> @ <input
							type="text" name="indiMyEmail2" class="email empty_check"
							id="email_2" title="도메인주소"
							oninput="this.value = this.value.replace(/[^A-Za-z..]/g, '');"
							onblur="emailCheck()" value="<%=emailCheck%>"> <select
							class="email" id="email_name" onChange="selectEmail(this)">
								<option value="">선택하세요</option>
								<option value="naver.com" <%=email2[0]%>>naver.com</option>
								<option value="daum.net" <%=email2[1]%>>daum.net</option>
								<option value="nate.com" <%=email2[2]%>>nate.com</option>
								<option value="hanmail.net" <%=email2[3]%>>hanmail.net</option>
								<option value="gmail.com" <%=email2[4]%>>gmail.com</option>
								<option value="hotmail.com" <%=email2[5]%>>hotmail.com</option>
								<option value="0">직접입력</option>
						</select><br> <span id="emailError"></span></td>
					</tr>
					<tr>
						<td colspan="2" class="tLine"><div class="Line"></div></td>
					</tr>
					<tr>
						<td id="top">전화번호</td>
						<td class="phone_td"><select class="phone" id="phone_number"
							name="indiMyPhone1">
								<option value="010" <%=phone1[0]%>>010</option>
								<option value="011" <%=phone1[1]%>>011</option>
								<option value="016" <%=phone1[2]%>>016</option>
								<option value="017" <%=phone1[3]%>>017</option>
						</select> - <input type="text" name="indiMyPhone2"
							class="phone empty_check" id="phone1" title="휴대폰번호" size="3"
							maxlength="4"
							oninput="this.value = this.value.replace(/[^0-9.]/g, '');"
							onblur="phoneCheck()" value="<%=phone2%>"> - <input
							type="text" name="indiMyPhone3" class="phone empty_check"
							id="phone2" title="휴대폰번호" size="3" maxlength="4"
							oninput="this.value = this.value.replace(/[^0-9.]/g, '');"
							onblur="phoneCheck()" value="<%=phone3%>"> <br> <span
							id="phoneError"></span> <!--                         <button type="submit" id="checkNumber">인증번호 받기</button><br> -->
							<!--                         <input type="text" id="check"> --> <!--                         <button type="submit" id="confirm">확인</button> -->
						</td>
					</tr>
					<tr>
						<td colspan="2" class="tLine"><div class="Line"></div></td>
					</tr>
					<tr>
						<td colspan="2">어떤 경로로 알게되었나요? <select id="route"
							name="indiMyRoute">
								<option value="" <%=route[6]%>>선택하세요</option>
								<option value="SNS" <%=route[0]%>>SNS</option>
								<option value="뉴스" <%=route[1]%>>뉴스</option>
								<option value="친구 및 지인소개" <%=route[2]%>>친구 및 지인소개</option>
								<option value="TV광고" <%=route[3]%>>TV광고</option>
								<option value="포털사이트 검색" <%=route[4]%>>포털사이트 검색</option>
								<option value="기타" <%=route[5]%>>기타</option>
						</select>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="tLine"><div class="Line"></div></td>
					</tr>

				</table>
				<div class="box">
					<button class="buttonDiv" type="submit" id="modify">정보수정</button>
					<button class="buttonDiv" type="button" id="main"
						onclick="location.href='<%=request.getContextPath()%>'">메인으로</button>
					<button class="buttonDiv" type="button" id="withdraw"
						onclick="deleteMember()">회원탈퇴</button>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		var dev_pwd1 = document.getElementById('dev_pwd1');
		var dev_pwconfirm = document.getElementById('dev_pwconfirm');
		var PwdSafeResult = document.getElementById('PwdSafeResult');
		var dev_chk_pwd_confirm = document
				.getElementById('dev_chk_pwd_confirm');
		var pwdRegExp = /^[a-zA-Z0-9@$!%*?&]{6,16}$/;
		var pwdconfirmRegExp = /^[a-zA-Z0-9@$!%*?&]{6,16}$/;

		function focusOut2() {
			if (!pwdRegExp.test(dev_pwd1.value)) {
				PwdSafeResult.innerHTML = "6~16자 영문, 숫자, 특수문자로 입력해야합니다";
				PwdSafeResult.style.color = "red";
				/* dev_pwd1.focus(); */
			} else {
				PwdSafeResult.innerHTML = null;
				dev_pwd1.next();
			}
		};

		function focusOut3() {
			if (dev_pwd1.value != dev_pwconfirm.value) {
				dev_chk_pwd_confirm.innerHTML = "비밀번호가 틀립니다. 다시 확인하여 입력해주세요.";
				dev_chk_pwd_confirm.style.color = "red";
				/* dev_pwconfirm.focus(); */
			} else {
				dev_chk_pwd_confirm.innerHTML = null;
				dev_pwconfirm.next();
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
		function indiUpdate_butt() {
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

			return true;
		}

		function deleteMember() {
			var del_check = confirm("정말 삭제하시겠습니까?");
			if (del_check) {
				window.location.href = 'MemberDelete.id';
			}
		}
	</script>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>