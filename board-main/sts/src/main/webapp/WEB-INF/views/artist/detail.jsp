<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="${path}/resources/css/artist_detail.css" />
<title>아티스트 상세</title>
</head>

<body>
	<div id="board-catetory">
		<input type="hidden" id="${detailArtist.artist_idx}"
			name="${detailArtist.artist_idx}"> <a>아티스트</a> <a>></a> <a>${detailArtist.artist_name}</a>
	</div>
	<div class="artist_detail">
		<div class="left">
			<img src="${detailArtist.artist_photo}" alt="Image 1" id="prof">
			<div class="btnbtn">
				<a href="<c:url value='/artist/update?artist_idx=${detailArtist.artist_idx}'/>">수정</a> 
				<a href="<c:url value='/artist/artistDelete?artist_idx=${detailArtist.artist_idx}'/>">삭제</a>
			</div>
		</div>
		<div class="middle">
			<p>${detailArtist.artist_name}</p>
			<p>${detailArtist.artist_nationality}</p>
			<p>${detailArtist.artist_edu}</p>
			<div class="social">
				<img src="${path}/resources/img/like.png" alt="welp"> 
				<img src="${path}/resources/img/share.png" alt="welp"> 
				<img src="${path}/resources/img/home.png" alt="welp"> 
				<a href="" id="chat">1:1 챗팅</a>
			</div>
		</div>
	</div>

	<div id="categories">
		<div class="category" id="category1"
			onclick="showContent('gallery',this)">작품</div>
		<div class="category" id="category2"
			onclick="showContent('career',this)">경력/이력</div>
		<div class="category" id="category3"
			onclick="showContent('intro',this)">작가소개</div>
	</div>
	
	<div id="galleryContent">
    <c:forEach var="detail" items="${detailPicture}">
        <div class="image-container">
            <a href="/artist/updatePicture?picture_idx=${detail.picture_idx}">
            <img src="${detail.picture_file}"></a>
            <p class="gallery_title">${detail.picture_title}</p>
            <p>${detail.picture_size}</p>
            <p>${detail.picture_supplies}</p>
        </div>
    </c:forEach>
</div>

<div id="careerContent" style="display: none;">
    <!-- Career content here (paragraphs) -->
    <p>${detailArtist.artist_career}</p>
</div>

<div id="introContent" style="display: none;">
    <!-- Introduction content here (paragraphs) -->
    <p>${detailArtist.artist_note }</p>
</div>
	<div class="edit">
	<sec:authorize access="isAuthenticated() and hasRole('ROLE_ADMIN')">
		<a href="<c:url value='/artist/registrationWork?artist_idx=${detailArtist.artist_idx}'/>">작품등록</a>
	</sec:authorize>
		<a href="<c:url value='/artist/artistList?listPageNum=1'/>">목록</a>
	</div>

</body>
<script>
	let activeCategoryElement = null;

	function showContent(contentType, categoryElement) {
		if (activeCategoryElement) {
			activeCategoryElement.classList.remove('active');
		}
		categoryElement.classList.add('active');
		activeCategoryElement = categoryElement;

		const galleryContent = document.getElementById("galleryContent");
		const careerContent = document.getElementById("careerContent");
		const introContent = document.getElementById("introContent");

		galleryContent.style.display = "none";
		careerContent.style.display = "none";
		introContent.style.display = "none";

		if (contentType === 'gallery') {
			galleryContent.style.display = "block";
		} else if (contentType === 'career') {
			careerContent.style.display = "block";
		} else if (contentType === 'intro') {
			introContent.style.display = "block";
		}
	}

	window.onload = function() {
		const defaultCategory = document.getElementById('category1');
		showContent('gallery', defaultCategory);
	};
</script>

</html>