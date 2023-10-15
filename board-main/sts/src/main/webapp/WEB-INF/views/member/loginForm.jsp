<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" href="${path}/resources/css/login.css">
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<title>로그인</title>
<form action="/login" method="post">
	<div id="wrap" class="wrap">
		<header class="header" role="banner">
			<div class="header_inner">
				<a href="/" class="logo">
					<h1 class="blind">
						<img src="${path}/resources/img/logo_color.png">
					</h1>
				</a>
			</div>
		</header>
		<ul class="panel_wrap">
			<li class="panel_item" style="display: block;">
				<div class="content">
					<div class="id_pw_wrap">
						<div class="input_row" id="id_line">
							<img src="${path}/resources/img/person.png" alt="" class="id_con"> <input
								type="text" id="id" name="member_loginId" placeholder="   아이디"
								title="아이디" class="input_text" maxlength="41"> <span
								role="button" class="btn_delete" id="id_clear"
								style="display: none;"> <span class="icon_delete">
									<span class="blind">삭제</span>
							</span>
							</span>
						</div>
						<div class="input_row" id="pw_line">
							<img src="${path}/resources/img/password.png" alt="" class="password_con"> <input
								type="password" id="pw" name="member_password"
								placeholder="   비밀번호" title="비밀번호" class="input_text"
								maxlength="16"> <span role="button" class="btn_delete"
								id="pw_clear" style="display: none;"> <span
								class="icon_delete"> <span class="blind">삭제</span>
							</span>
							</span>
						</div>
					</div>
				</div>
				<div class="login_error_wrap" id="err_capslock"
					style="display: none;">
					<div class="error_message">
						<strong>CapsLock</strong>이 켜져 있습니다.
					</div>
				</div>

				<div class="login_error_wrap" id="err_empty_id"
					style="display: none;">
					<div class="error_message">
						<strong>아이디</strong>를 입력해 주세요.
					</div>
				</div>

				<div class="login_error_wrap" id="err_empty_pw"
					style="display: none;">
					<div class="error_message">
						<strong>비밀번호</strong>를 입력해 주세요.
					</div>
				</div>
				<div class="login_error_wrap" id="err_common" style="display: none;">
					<div class="error_message" style="width: 90%"></div>
				</div>
				<div class="btn_login_wrap">
					<button type="submit" class="btn_login" id="log.login">
						<span class="btn_text">로그인</span>
					</button>
				</div>
			</li>
		</ul>
		<ul class="find_wrap" id="find_wrap">
		<a target="_blank" href="/member/findId" class="find_text">아이디 찾기</a> |
		<a target="_blank" href="/member/findPw" class="find_text">비밀번호 찾기</a>
		</ul>
		<div style="text-align: center;">
		      <!-- 아래와같이 아이디를 꼭 써준다. -->
		   	 <a id="naverIdLogin_loginButton"  href="javascript:void(0)">
		        <img src="${path}/resources/img/naver_icon.png" width="50" height="50">
		    </a>
		</div>
	</div>
	
	<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" />
</form>
<script>

var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "bzYL6NIlAbwM6Ot1YmIL", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
			callbackUrl: "http://localhost:8081/naverLogin", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
			isPopup: false,
			callbackHandle: true
		}
	);	

naverLogin.init();

window.addEventListener('load', function () {
	naverLogin.getLoginStatus(function (status) {
		if (status) {
			var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
    		
			console.log(naverLogin.user); 
    		
            if( email == undefined || email == null) {
				alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
				naverLogin.reprompt();
				return;
			}
		} else {
			console.log("callback 처리에 실패하였습니다.");
		}
	});
});


var testPopUp;
function openPopUp() {
    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
}
function closePopUp(){
    testPopUp.close();
}

function naverLogout() {
	openPopUp();
	setTimeout(function() {
		closePopUp();
		}, 1000);
	
	
}
</script>