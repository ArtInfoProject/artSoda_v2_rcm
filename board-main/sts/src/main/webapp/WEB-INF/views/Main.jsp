<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<sec:authorize access="isAuthenticated()">
<a href="/logout">로그아웃</a>
<a href="/member/myPage">마이페이지</a>
</sec:authorize>
<sec:authorize access="!isAuthenticated()">
<a href="/login">로그인</a>
<a href="/member/joinPage">회원가입</a>
</sec:authorize>
<a href="/community/communityList?listPageNum=1">커뮤니티 게시판</a>
<a href = "/exhibition/exhibitionList?listPageNum=1">전시회</a>
<a href="/contest/contestList?listPageNum=1">공모전</a>
<a href="/artist/artistList?listPageNum=1">아티스트</a>
</body>
</html>