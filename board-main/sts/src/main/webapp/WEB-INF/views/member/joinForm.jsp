<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<link rel="stylesheet" href="${path}/resources/css/joinForm.css" />
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous">
	
</script>
<script src="<c:url value="/resources/js/joinForm.js"/>"></script>
<script>
	// 아이디 중복 검사 여부
	var checkDuplication = false;

	function CheckId() {
		// 아이디 이력란에 입력한 데이터 저장
		var loginId = $('#member_loginId').val();
		if (loginId == '') {
			alert('아이디를 입력해 주세요.');
			$('#member_loginId').focus();
			return; // 함수 종료
		}

		// 아이디 유효성 검사
		// 영문 소문자와 숫자로만 구성, 5~19자
		var reg = /^[a-z0-9]{5,19}$/;
		if (!reg.test(loginId)) {
			alert('아이디는 5~19자의 영문 소문자와 숫자로 입력해 주세요.');
			$('#member_loginId').focus();
			return;
		}

		// 비동기통신을 통해 아이디 존재 여부 확인
		$.ajax({
			url : "http://localhost:8080/member/checkId",
			type : "GET",
			data : {
				loginId : loginId
			},
			error : function(e) {
				console.log(e);
				alert(e.statusText + '서버와 통신하는데 실패하였습니다.');
			},
			success : function(result) {
				console.log("result = " + result);
				if (result == "success") {
					alert('사용할 수 있는 아이디입니다.');
					checkDuplication = true;
				} else {
					alert('이미 존재하는 아이디입니다.');
					$('#member_loginId').focus();
				}
			}
		});
	}

	function initCheck() {
		checkDuplication = false;
	}

	function is_checked() {
		var checkbox_rg = document.getElementById('member_category_regular');
		var checkbox1_cp = document.getElementById('member_category_company');
		if (!checkbox_rg.checked && !checkbox1_cp.checked) {
			alert('가입유형을 체크해 주세요.');
			return;
		}
	}

	function joinMember() {
		var loginId = $('#member_loginId');
		var password = $('#member_password');
		var passwordCheck = $('#member_password_check');
		var name = $('#member_name');
		var tel = $('#member_tel');
		var email = $('#member_email');

		// 아이디 입력 여부 확인
		if (loginId.val() == '') {
			alert('아이디를 입력해 주세요.');
			$('#member_loginId').focus();
			return;
		}

		// 비밀번호 입력 여부 확인
		if (password.val() == '') {
			alert('비밀번호를 입력해 주세요.');
			$('#member_password').focus();
			return;
		}

		// 비밀번호확인 입력 여부 확인
		if (passwordCheck.val() == '') {
			alert('비밀번호확인을 입력해 주세요.');
			$('#member_password_check').focus();
			return;
		}

		// 성명 입력 여부 확인
		if (name.val() == '') {
			alert('성명을 입력해 주세요.');
			$('#member_name').focus();
			return;
		}

		// 전화번호 입력 여부 확인
		if (tel.val() == '') {
			alert('전화번호를 입력해 주세요.');
			$('#member_tel').focus();
			return;
		}

		// 이메일 입력 여부 확인
		if (email.val() == '') {
			alert('이메일을 입력해 주세요.');
			$('#member_email').focus();
			return;
		}

		// 가입유형 입력 여부 확인
		is_checked();

		// 아이디 유효성 검사
		// 영문 소문자와 숫자로만 구성, 5~19자
		var reg = /^[a-z0-9]{5,19}$/;
		if (!reg.test(loginId.val())) {
			alert('아이디는 5~19자의 영문 소문자와 숫자로 입력해 주세요.');
			$('#member_loginId').focus();
			return;
		}

		// 비밀번호 유효성 검사
		// 영문 대소문자와 숫자, 특수문자를 모두 포함, 8~16자
		var reg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$/;
		console.log(reg.test(password.val()));
		if (!reg.test(password.val())) {
			alert('비밀번호는 8~16자의 영문 대소문자, 숫자, 특수문자를 모두 포함하도록 입력해 주세요.');
			$('#member_password').focus();
			return;
		}

		// 성명 유효성 검사
		// 한글로 구성, 2~10자
		var reg = /^[가-힣]{2,10}$/;
		if (!reg.test(name.val())) {
			alert('이름은 2~10자의 한글로 입력해 주세요.');
			$('#member_name').focus();
			return;
		}

		// 전화번호 유효성 검사
		// 숫자로만 구성, 10~12자
		var reg = /^[0-9]{10,12}$/;
		if (!reg.test(tel.val())) {
			alert('유효하지 않은 전화번호입니다. 전화번호는 10~12자의 숫자로 입력해 주세요.');
			$('#member_tel').focus();
			return;
		}

		// 이메일 유효성 검사
		// '[a-zA-Z0-9._%+-]+ : 이메일 주소의 로컬 파트(사용자명 부분)에 해당하는 부분이다. 알파벳 대소문자와 숫자, 그리고 특수 문자(._%+-)가 하나 이상 연속해서 나와야 한다.
		// '@' : 이메일 주소에서 로컬 파트와 도메인 파트를 구분하는 구분 기호.
		// '[a-zA-Z0-9.-]+' : 이메일 주소의 도메인 파트에 해당하는 부분이다. 알파벳 대소문자와 숫자, 그리고 하이픈(-)과 마침표(.)가 하나 이상 연속해서 나와야 한다.
		// '\.' : 도메인 파트와 최상위 도메인(TLD)을 구분하는 마침표(.)이다. 마침표는 정규식에서 특별한 의미를 가지므로 백슬래시(\)로 이스케이핑되었다.
		// '[a-zA-Z]{2,}' : 최상위 도메인(TLD)에 해당하는 부분이다. 알파벳 대소문자로 이루어져 있으며, 최소 2자 이상이어야 한다.
		var reg = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
		if (!reg.test(email.val())) {
			alert('유효하지 않은 이메일 주소입니다. 올바른 이메일 주소를 입력해주세요.');
			$('#member_email').focus();
			return;
		}

		if (!checkDuplication) {
			alert('아이디 중복 체크를 진행해 주세요.');
			return;
		}

		if (password.val() != passwordCheck.val()) {
			alert('비밀번호와 동일하게 입력해 주세요.');
			return;
		}

		$('#joinForm').submit();
	}
</script>

<form action="/member/join" id="joinForm" method="post">
	<div class="contents">
		<h4 class="memberJoin">회원 가입</h4>
		<div class="inner_contents">
			<p></p>
			<div class="contents_row">
				<em>▪︎</em>아이디 :: <input type="text" id="member_loginId"
					placeholder=" 5~19자리/영문,숫자 사용가능 " name="member_loginId"
					oninput="initCheck()" class="form">
				<button type="button" onclick="CheckId()" class="doubleCheck">중복확인</button>
			</div>
			<div class="contents_row">
				<em>▪︎</em> 비밀번호 :: <input type="password" id="member_password"
					name="member_password" placeholder=" 8~16자리/영문,숫자,특수문자 조합"
					class="form">
			</div>
			<div class="contents_row">
				<em>▪︎</em>비밀번호 확인 :: <input type="password"
					id="member_password_check" name="member_passwordCheck"
					placeholder=" 설정한 비밀번호를 입력해주세요" class="form">
			</div>
			<div class="contents_row">
				<em>▪︎</em>이름 :: <input type="text" id="member_name"
					name="member_name" placeholder=" 이름 입력" class="form">
			</div>
			<div class="contents_row">
				<em>▪︎</em>전화번호 :: <input type="text" id="member_tel"
					name="member_tel" placeholder=" '-'를 빼고 숫자만 입력" class="form">
			</div>
			<div class="contents_row">
				<em>▪︎</em>이메일 :: <input type="text" id="member_email"
					name="member_email" placeholder=" user@email.com" class="form">
				<p class="message">⇲ 전시 및 관련 정보를 수신할 때 사용됩니다.</p>
			</div>
			<div class="contents_row">
				<em>▪︎</em>가입 유형 :: <input type="radio" id="member_category_regular"
					name="member_category" value="regular"> 개인 <a> / </a> <input
					type="radio" id="member_category_company" name="member_category"
					value="company"> 기업
			</div>
		</div>
	</div>
	<div class="btn_join">
		<button type="button" onclick="joinMember()" class="btn_submit">가입</button>
		<button type="button" onclick="location.href='/'" class="btn_cancel">취소</button>
	</div>
	<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}">
</form>
