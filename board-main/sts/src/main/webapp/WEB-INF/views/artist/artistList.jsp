<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Noto+Sans+KR:wght@300;700&family=Quicksand:wght@600&display=swap"
	rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel="stylesheet" href="${path}/resources/css/artist.css" />
<title>아티스트</title>
</head>
<body>
	<div id="board-catetory">
		<p>아티스트</p>
	</div>
	<div class="gallery">
	<div class="grid-container">
		<c:forEach items="${list}" var="artist">
			<div class="grid-item">
				<a href="/artist/detail?artist_idx=${artist.artist_idx}">
					<img src="${artist.artist_photo}">
					<p class="item-label">${artist.artist_name}</p>
					<p class="item-label2">Artist</p>
				</a>
			</div>
		</c:forEach>
    </div>
</div>
	<sec:authorize access="hasRole('ROLE_ADMIN')">
	<div class="list">
		<a href="<c:url value='/artist/write'/>">작가등록</a>
	</div>
	</sec:authorize>
		<div class="pagination">
		<c:if test="${page.prev}">
			<span> <a
				href="/aritst/artistList?listPageNum=${page.startPageNum - 1}${page.searchTypeKeyword}">&laquo;</a>
			</span>
		</c:if>
		<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}"
			var="num">
			<span> <c:if test="${selectPageNum != num}">
					<a
						href="/artist/artistList?listPageNum=${num}${page.searchTypeKeyword}">${num}</a>
				</c:if> <c:if test="${selectPageNum == num}">
					<a class="active">${num}</a>
				</c:if>
			</span>
		</c:forEach>
		<c:if test="${page.next}">
			<span> <a
				href="/artist/artistList?listPageNum=${page.endPageNum + 1}${page.searchTypeKeyword}">&raquo;</a>
			</span>
		</c:if>
	</div>
	<div id="search-comm">
		<select name="searchType" id="comm-search-cate">
			<option value="name">작가</option>
			<option value="nationality">국적</option>
		</select>
		 <input type="text" placeholder="검색어를 입력해주세요" name="keyword"
			value="${page.keyword}">
		<button type="button" id="searchBtn">검색</button>
	</div>
</body>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		 
	    document.getElementById("searchBtn").onclick = function () {
	     
	 	  let searchType = document.getElementsByName("searchType")[0].value;
	 	  let keyword =  document.getElementsByName("keyword")[0].value;
	 	  
	 	  location.href = "/artist/artistList?listPageNum=1" + "&searchType=" + searchType + "&keyword=" + keyword;
	 	
	 	 };
	 	 
	});	 
</script>
</html>