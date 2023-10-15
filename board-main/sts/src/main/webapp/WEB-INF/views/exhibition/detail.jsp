<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Noto+Sans+KR:wght@300;700&family=Quicksand:wght@600&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="${path}/resources/css/exi_detail.css" />

<meta charset="UTF-8">
<title>전시회 상세</title>
</head>
<body>
	<div class="ex_detail_header">
		<p>${detail.exhibition_title}</p>
		<p>작성일자: ${detail.exhibition_registDate}</p>
	</div>
	<div class="ex_detail_contents">
		<img src="${detail.exhibition_img}" alt="Image 1">
		<div class="ex_details">
			<table>
				<tr>
					<th>작가명
					<td>| ${detail.exhibition_writer}</td>
				</tr>
				<tr>
					<th>전시기간
					<td>| ${detail.exhibition_start} ~ ${detail.exhibition_end}</td>
				</tr>
				<tr>
					<th>전시지역
					<td>| ${detail.exhibition_region}</td>
				</tr>
				<tr>
					<th>전시장소
					<td>| ${detail.exhibition_location}</td>
				</tr>
				<tr>
					<th>관련링크
					<td>| <a href="${detail.exhibition_url}">${detail.exhibition_url}</a></td>
				</tr>
			</table>
		</div>
		<p class="ex_detail_content_long">${detail.exhibition_contents}</p>

		<div class="edit">
			<sec:authorize access="isAuthenticated() and hasRole('ROLE_ADMIN')">
				<a href="/exhibition/update?exhibition_idx=${detail.exhibition_idx}"
					role="button">수정</a>
				<a href="/exhibition/delete?exhibition_idx=${detail.exhibition_idx}"
					role="button">삭제</a>
			</sec:authorize>
		</div>
		<div class="list">
			<a href="<c:url value='/exhibition/exhibitionList?listPageNum=1'/>">목록</a>
		</div>
		<div id="recommendations"></div>
	</div>
<script>
window.onload = function() {
    var exhibitionTitle = document.querySelector(".ex_detail_header p").innerText;
    
    fetch('http://127.0.0.1:5002/recommendations', {
        method: 'POST',
        headers: {
        'Content-Type': 'application/json'
        },
        body: JSON.stringify({ exhibition_title: exhibitionTitle })
    })
    .then(response => response.json())
    .then(data => {
        console.log(data);
        const recommendationsDiv = document.getElementById('recommendations');
        recommendationsDiv.innerHTML = '';
        data.forEach(recommendation => {
        const title = recommendation.title;
        const description = recommendation.description;
        const titleElement = document.createElement('h3');
        titleElement.textContent = title;

        const descriptionElement = document.createElement('p');
        descriptionElement.textContent = description;
        recommendationsDiv.appendChild(titleElement);
        recommendationsDiv.appendChild(descriptionElement);
        });
    })
    .catch(error => {
        console.error('Error:', error);
    })
}
</script>
</body>
</html>