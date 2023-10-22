<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<link rel="stylesheet" href="${path}/resources/css/exi_board.css" />
<div id="board-catetory">
	<span>전시소식 </span>
	<c:choose>
		<c:when test="${param.category eq ''and param.status eq '종료'}">
			<span>>> <span class="cate">지난전시</span></span>
		</c:when>
		<c:when test="${param.category eq ''}">
			<span class="cate"></span>
		</c:when>
		<c:otherwise>
			<span>>><span class="cate">${param.category}</span></span>
		</c:otherwise>
	</c:choose>
</div>
<div class="gallery">
	<div class="grid-container">
		<c:forEach items="${list}" var="exhibition">
			<div class="grid-item">
				<a
					href="/exhibition/detail?exhibition_idx=${exhibition.exhibition_idx}">
					<img src="${exhibition.exhibition_img}" alt="Image 1">
					<p class="item-label">
						<a
							href="/exhibition/detail?exhibition_idx=${exhibition.exhibition_idx}">
							${exhibition.exhibition_title}&nbsp;</a>
					</p>
					<p class="item-label2">${exhibition.exhibition_start}~${exhibition.exhibition_end}</p>
				</a>
			</div>
		</c:forEach>
	</div>
</div>
<sec:authorize access="isAuthenticated() and hasRole('ROLE_ADMIN')">
	<div class="list">
		<a href="<c:url value='/exhibition/write'/>">글쓰기</a>
	</div>
</sec:authorize>

<div class="pagination">
	<c:if test="${page.prev}">
		<span> <a
			href="/exhibition/exhibitionList?category=${param.category}&status=${param.status}&listPageNum=${page.startPageNum - 1}${page.searchTypeKeyword}">&laquo;</a></span>
	</c:if>
	<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}"
		var="num">
		<span> <c:choose>
				<c:when test="${selectPageNum != num}">
					<a
						href="/exhibition/exhibitionList?category=${param.category}&status=${param.status}&listPageNum=${num}${page.searchTypeKeyword}">${num}</a>
				</c:when>
				<c:otherwise>
					<a class="active">${num}</a>
				</c:otherwise>
			</c:choose>
		</span>
	</c:forEach>
	<c:if test="${page.next}">
		<span> <a
			href="/exhibition/exhibitionList?category=${param.category}&status=${param.status}&listPageNum=${page.endPageNum + 1}${page.searchTypeKeyword}">&raquo;</a></span>
	</c:if>
</div>

<div>
	<!-- 		키워드 제목, 작가이름, 내용 검색키워드쓰기 -->
	<div id="search-comm">
		<select name="searchType" id="searchOption">
			<option value="title">제목</option>
			<option value="writer">작가</option>
			<option value="content">내용</option>
		</select> <input type="text" name="keyword" placeholder="검색어를 입력해주세요">
		<button type="button" id="searchBtn1">검색</button>
	</div>
</div>
<script>
	document.getElementById("searchBtn1").onclick = function() {
		let searchType = document.getElementsByName("searchType")[0].value;
		let keyword = document.getElementsByName("keyword")[0].value;
		let category = '${param.category}';

		console.log(category)
		console.log(searchType)
		console.log(keyword)

		location.href = "/exhibition/exhibitionList?listPageNum=1"
				+ "&searchType=" + searchType + "&keyword=" + keyword
				+ "&category=" + category;
	};
</script>