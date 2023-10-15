<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<link rel="stylesheet" href="${path}/resources/css/newpassword.css">
<title>새 비밀번호 설정</title>
<form action="/member/updatePwPro" method="post">
	<!-- 로고 -->
	<header class="header" role="banner">
		<div class="header_inner">
			<a href="/" class="logo">
				<h1 class="blind">
					<img src="${path}/resources/img/logo_color.png">
				</h1>
			</a>
		</div>
	</header>
	<input type="hidden" value="${res.member_idx}" name="member_idx" /> <input
		type="hidden" value="${res.member_loginId}" name="member_loginId" />
	<div class="container">
		<p>⌦ 새 비밀번호 설정</p>
		<div class="input_first">
			<label>새 비밀번호</label> <input type="password" id="member_password"
				name="member_password">
		</div>
		<div class="input">
			<label>새 비밀번호 확인</label> <input type="password"
				name="member_passwordCheck">
		</div>
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
		<button type="submit" class="btn_find">변 경</button>
	</div>
</form>