<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Member member = (Member) request.getAttribute("loginUser");

String[] phone = member.getUserPhone().split("-");
String phoneCheck = phone[0];
String phone2 = phone[1];
String phone3 = phone[2];

String[] email = member.getUserEmail().split("@");
String email1 = email[0];
String emailCheck = email[1];

String[] compNum = member.getCompanyNum().split("-");
String compNum1 = compNum[0];
String compNum2 = compNum[1];
String compNum3 = compNum[2];

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
<link href='<%=request.getContextPath()%>/css/compMyPage.css'
	rel="stylesheet" type="text/css" />
</head>
<body>
	<%@ include file="../common/navbarLink.jsp"%>
	<div id="notice_detail_wrap">
		<div id="form_wrap">
			<div class="form">
				<div class="title">
					<h1>MyPage</h1>
				</div>
				<form action="<%=request.getContextPath()%>/compMyUpdateInsert.iu"
					method="post" id="form_wrap" onsubmit="return compUpdate_butt()">
					<div id="idDiv">
						<div class="idClass" id="id">아이디</div>
						<%=member.getUserId()%><input id="idIn" name="compMyUserId"
							type="hidden" placeholder="6~16자 영문, 숫자" title="아이디"
							maxlength="16" onblur="focusOut1();"
							value="<%=member.getUserId()%>">
						<!-- <button id="idCheck" value="중복확인">중복확인</button> -->
						<br> <span class="Error" id="idError"></span>
					</div>
					<div class="pwdClass" id="pwd">비밀번호</div>
					<input id="pwdIn" name="compMyUserPwd" class="empty_check"
						type="password" placeholder="6~16자 영문, 숫자, 특수문자" title="비밀번호"
						maxlength="16" onblur="focusOut2();"><br> <span
						class="Error" id="pwdError"></span><br>
					<div class="pwdCheckClass" id="pwdCheck">비밀번호 확인</div>
					<input id="pwdCheckIn" class="empty_check" type="password"
						title="비밀번호확인" maxlength="16" onblur="focusOut3();"><br>
					<span class="Error" id="pwdCheckError"></span><br>
					<div class="phoneClass" id="phone">전화번호</div>
					<select class="phoneNumClass" name="compMyPhone1" id="phone1">
						<option value="010" <%=phone1[0]%>>010</option>
						<option value="011" <%=phone1[1]%>>011</option>
						<option value="016" <%=phone1[2]%>>016</option>
						<option value="017" <%=phone1[3]%>>017</option>
					</select> - <input class="phoneNumClass empty_check" name="compMyPhone2"
						id="phone2" type="text" size="3" maxlength="4" title="전화번호"
						oninput="this.value = this.value.replace(/[^0-9.]/g, '');"
						onblur="phoneCheck()" value="<%=phone2%>"> - <input
						class="phoneNumClass empty_check" name="compMyPhone3" id="phone3"
						type="text" size="3" maxlength="4" title="전화번호"
						oninput="this.value = this.value.replace(/[^0-9.]/g, '');"
						onblur="phoneCheck()" value="<%=phone3%>">
					<!-- <button id="phonepass" value="확인">확인</button> -->
					<br> <span id="phoneError"></span><br>
					<div class="emailClass" id="email">이메일</div>
					<input id="emailIn" class="empty_check" type="text" title="이메일"
						name="compMyEmail1"
						oninput="this.value = this.value.replace(/[^A-Za-z0-9]/g, '');"
						onblur="emailCheck()" value="<%=email1%>"> @ <input
						id="emailIn2" class="empty_check" type="text" title="도메인주소"
						name="compMyEmail2"
						oninput="this.value = this.value.replace(/[^A-Za-z..]/g, '');"
						onblur="emailCheck()" value="<%=emailCheck%>"> <select
						id="area" onChange="selectEmail(this)">
						<option value="">선택하세요</option>
						<option value="naver.com" <%=email2[0]%>>naver.com</option>
						<option value="daum.net" <%=email2[1]%>>daum.net</option>
						<option value="nate.com" <%=email2[2]%>>nate.com</option>
						<option value="hanmail.net" <%=email2[3]%>>hanmail.net</option>
						<option value="gmail.com" <%=email2[4]%>>gmail.com</option>
						<option value="hotmail.com" <%=email2[5]%>>hotmail.com</option>
						<option value="0">직접입력</option>
					</select><br> <span id="emailError"></span>
					<hr>
					<div class="businessClass" id="business">사업자등록번호</div>
					<input class="businessIn empty_check" id="business1"
						name="compMyBusiNum1" type="text" title="사업자번호" size="1"
						maxlength="3"
						oninput="this.value = this.value.replace(/[^0-9.]/g, '');"
						onblur="businessCheck()" value="<%=compNum1%>"> - <input
						class="businessIn empty_check" id="business2"
						name="compMyBusiNum2" type="text" title="사업자번호" size="3"
						maxlength="2"
						oninput="this.value = this.value.replace(/[^0-9.]/g, '');"
						onblur="businessCheck()" value="<%=compNum2%>"> - <input
						class="businessIn empty_check" id="business3"
						name="compMyBusiNum3" type="text" title="사업자번호" size="3"
						maxlength="5"
						oninput="this.value = this.value.replace(/[^0-9.]/g, '');"
						onblur="businessCheck()" value="<%=compNum3%>">
					<button id="businesspass" value="확인">확인</button>
					<br> <span id="businessError"></span>
					<div class="text">※ 사업자등록번호 도용 방지를 위해 기업인증을 시행하고 있습니다.</div>
					<div class="text">※ 지점·지사의 경우, 해당 지점·지사의 사업자등록번호를 입력해 주세요.</div>
					<div class="text">※ 인증이 되지 않을 경우 고객센터(T.1588-9351)로 문의해 주세요.</div>
					<div class="companyClass" id="company">회사/점포명</div>
					<input id="companyIn" class="empty_check" name="compMyName"
						type="text" title="회사/점포명" onblur="companyCheck()"
						value="<%=member.getCompanyName()%>"><br> <span
						id="companyError"></span><br>
					<div class="leaderClass" id="leader">대표자명</div>
					<input id="leaderIn" class="empty_check" name="compMyCeoName"
						type="text" title="대표자명" onblur="leaderCheck()"
						value="<%=member.getUserName()%>"><br> <span
						id="leaderError"></span><br>
					<div class="addressClass" id="address">회사/점포주소</div>
					<input id="addressIn1" class="empty_check" name="compMyAddress"
						type="text" title="회사/점포주소" onblur="addressCheck()"
						value="<%=member.getCompanyAddress()%>"><br> <span
						id="addressError"></span><br>
					<hr>
					<div class="pathClass" id="path">어떤 경로로 알게 되었나요?</div>
					<select id="pathIn" name="compMyRoute">
						<option value="" <%=route[6]%>>선택하세요</option>
						<option value="SNS" <%=route[0]%>>SNS</option>
						<option value="뉴스" <%=route[1]%>>뉴스</option>
						<option value="친구 및 지인소개" <%=route[2]%>>친구 및 지인소개</option>
						<option value="TV광고" <%=route[3]%>>TV광고</option>
						<option value="포털사이트 검색" <%=route[4]%>>포털사이트 검색</option>
						<option value="기타" <%=route[5]%>>기타</option>
					</select>
					<hr>
					<div class="form-group" id="divId"></div>
					<div id="buttonDiv">
						<button class="join2" type="submit">정보수정완료</button>
						<button type="button" class="join2"
							onclick="location.href='<%=request.getContextPath()%>'">메인으로</button>
						<button type="button" class="join2" id="drop"
							onclick="deleteMember()">회원탈퇴</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var dev_pwd1 = document.getElementById('pwdIn');
		var dev_pwconfirm = document.getElementById('pwdCheckIn');
		var idError = document.getElementById('idError');
		var pwdError = document.getElementById('pwdError');
		var pwdCheckError = document.getElementById('pwdCheckError');
		var pwdRegExp = /^[a-zA-Z0-9@$!%*?&]{6,16}$/;
		var pwdconfirmRegExp = /^[a-zA-Z0-9@$!%*?&]{6,16}$/;

		function focusOut2() {
			if (!pwdRegExp.test(dev_pwd1.value)) {
				pwdError.innerHTML = "6~16자 영문, 숫자, 특수문자로 입력해야합니다";
				pwdError.style.color = "red";
				/* dev_pwd1.focus(); */
			} else {
				pwdError.innerHTML = null;
				dev_pwd1.next();
			}
		};

		function focusOut3() {
			if (dev_pwd1.value != dev_pwconfirm.value) {
				pwdCheckError.innerHTML = "비밀번호가 틀립니다. 다시 확인하여 입력해주세요.";
				pwdCheckError.style.color = "red";
				/* dev_pwconfirm.focus(); */
			} else {
				pwdCheckError.innerHTML = null;
				dev_pwconfirm.next();
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
		function compUpdate_butt() {
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
			return true
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