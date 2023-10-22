<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<div class="member">
<sec:authorize access="!isAuthenticated()">
	<a href="/">HOME</a> <a>|</a> <a href="/login">로그인</a> <a>|</a> <a href="/member/joinPage">회원가입</a>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
<a href="/">HOME</a> <a>|</a> <a href="/logout">로그아웃</a> <a>|</a> <a href="/member/myPage">마이페이지</a>
</sec:authorize>
</div>
<div class="wrapper">
	<nav>
		<div class="logo">
			<a href="/"><img src="${path}/resources/img/logo_color.png" alt="Logo" class="logo-img"></a>
		</div>
		<div class="content">
			<ul>
				<li><a href="/exhibition/exhibitionList?category=&status=&listPageNum=1" class="main">전시소식</a>
					<ul class="dropdown">
						<li><a href="/exhibition/exhibitionList?category=개인전&status=&listPageNum=1">개인전</a></li>
						<li><a href="/exhibition/exhibitionList?category=단체전&status=&listPageNum=1">단체전</a></li>
						<li><a href="/exhibition/exhibitionList?category=&status=종료&listPageNum=1">지난전시</a></li>
					</ul></li>
				<li><a href="/contest/contestList?listPageNum=1" class="main">공모전</a></li>
				<li><a href="/artist/artistList?listPageNum=1" class="main">아티스트</a></li>
				<li><a href="/community/communityList?listPageNum=1" class="main">커뮤니티</a></li>
			</ul>
		</div>
		<div class="search">
			<form class="naviForm">
				<input type="search" placeholder="전시회, 갤러리, 작가 검색">
				<button type="submit">Search</button>
			</form>
		</div>
	</nav>
</div>

