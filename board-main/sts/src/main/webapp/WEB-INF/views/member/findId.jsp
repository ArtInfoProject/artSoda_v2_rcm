<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<link rel="stylesheet" href="${path}/resources/css/find.css">
<form action="/member/findIdPro" method="post">
	<header class="header" role="banner">
		<div class="header_inner">
			<a href="/" class="logo">
				<h1 class="blind">
					<img src="${path}/resources/img/logo_color.png">
				</h1>
			</a>
		</div>
	</header>
	<div class="container">
		<p>⌦ 아이디 찾기</p>
		<div class="input_first">
			<input type="text" placeholder="이름을 입력해주세요" class="member_name"
				name="member_name">
		</div>
		<div class="input">
			<input type="text" placeholder="이메일을 입력해주세요" class="member_email"
				name="member_email">
		</div>
		<button type="submit" class="btn_find">찾 기</button>
	</div>
	<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" />
</form>
