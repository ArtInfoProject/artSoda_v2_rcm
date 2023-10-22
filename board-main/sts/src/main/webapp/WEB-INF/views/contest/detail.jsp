<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Noto+Sans+KR:wght@300;700&family=Quicksand:wght@600&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="${path}/resources/css/contest_detail.css" />
<title>공모전 상세</title>
</head>

<body>
	<div class="ex_detail_header">
		<p>${detail.contest_title }</p>
	</div>
	<sec:authorize access="isAuthenticated() and hasRole('ROLE_ADMIN')">
		<div class="edit">
			<a href="/contest/update?contest_idx=${detail.contest_idx}" >수정</a> 
			<a href="/contest/delete?contest_idx=${detail.contest_idx}">삭제</a>
		</div>
	</sec:authorize>
	<div class="ex_detail_contents">
		<img src="${detail.contest_file}" alt="Image 1">
		<p class="deadline">접수마감</p>
		<p class="deadline_t">${detail.contest_end}
			<br>
		</p>
		<p class="location">
			<br>${detail.contest_region}<br>
			 ${detail.contest_location}
		</p>
		<p class="ex_detail_content_long">${detail.contest_contents}
	</div>
	<div class="list_sns">
		<button>🙌🏻 SNS 공유</button>
	</div>
	<div class="files">
		<table>
			<tr>
				<td colspan="2" class="file">첨부파일</td>
			</tr>
			<tr>
				<td class="filelink"><a href="#" download>N/A</a></td>
				<td class="col-date">-	</td>
			</tr>
		</table>
		<table>
			<tr>
				<td class="link">관련링크</td>
			</tr>
			<tr>
				<td><a href="${detail.contest_url}">📰${detail.contest_url}</a></td>
			</tr>
		</table>
	</div>
	<div class="article">
		<table>
			<tr>
				<td>이전글</td>
				<td><a href="#">이전 글이 없습니다</a></td>
			</tr>
			<tr>
				<td>다음글</td>
				<td><a href="">다음 글이 없습니다</a></td>
			</tr>
		</table>
	</div>
	<div class="list">
		<a href="/contest/contestList?listPageNum=1">목록</a>
	</div>
</body>

</html>