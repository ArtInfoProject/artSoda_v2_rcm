<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${path}/resources/css/result.css">
<title>아이디결과값</title>
<header class="header" role="banner">
	<div class="header_inner">
		<a href="/" class="logo">
			<h1 class="blind">
				<img src="img/logo_color.png">
			</h1>
		</a>
	</div>
</header>
<div class="container">
	<div class="result">
		<p class="alert">:: 아이디 찾기 결과 ::</p>
		<p class="id_result">고객님의 아이디는 ${loginId} 입니다.</p>
	</div>
</div>
<div class="go_home">
	<a class="btn" href="/">홈으로</a>
</div>