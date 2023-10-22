<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<link rel="stylesheet" href="${path}/resources/css/com_board.css" />
<script src="https://code.jquery.com/jquery-3.7.1.js"
            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

<div id="board-catetory">
	<p>커뮤니티</p>
</div>
<div class="content-wrapper">
	<div id="side-menu">
		<ul>
			<li><a href="?category=&listPageNum=1" id="sub-cate"
				class="category selected">전체</a></li>
			<li><a href="?category=구인구직&listPageNum=1" id="sub-cate">구인
					구직</a></li>
			<li><a href="?category=광고홍보&listPageNum=1" id="sub-cate">광고
					홍보</a></li>
			<li><a href="?category=중고장터&listPageNum=1" id="sub-cate">중고
					장터</a></li>
		</ul>
	</div>

	<div id="table-container">
		<div id="notice-board">
			<span>📢 [공지] 게시판에 글을 올리실때, 카테고리 분류를 제대로 확인해주세요.</span>
		</div>
		<table>
			<c:forEach items="${list}" var="community">
				<tr>
					<td><a class="lol">${community.community_category}</a></td>
					<td><a
						href="/community/detail?community_idx=${community.community_idx}">
							${community.community_title}&nbsp;</a></td>
					<td>🧚🏻‍♀️${community.member_name}</td>
					<%-- 												<td><fmt:formatDate pattern="yyyy-MM-dd" value="${community.community_registDate}"/> </td> --%>
					<td>${community.community_registDate}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>
<div class="list">
	<a href="<c:url value='/community/write'/>">글쓰기</a>
</div>
<div id="search-comm">
	<select name="searchType" id="comm-search-cate">
		<option value="title">제목</option>
		<option value="content">내용</option>
		<option value="writer">글쓴이</option>
	</select> <input type="text" placeholder="검색어를 입력해주세요" name="keyword"
		value="${page.keyword}">
	<button type="button" id="searchBtn">검색</button>
</div>

<div class="pagination">
	<c:if test="${page.prev}">
		<span> <a
			href="/community/communityList?category=${param.category}&listPageNum=${page.startPageNum - 1}${page.searchTypeKeyword}">&laquo;</a>
		</span>
	</c:if>
	<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}"
		var="num">
		<span> <c:if test="${selectPageNum != num}">
				<a
					href="/community/communityList?category=${param.category}&listPageNum=${num}${page.searchTypeKeyword}">${num}</a>
			</c:if> <c:if test="${selectPageNum == num}">
				<a class="active">${num}</a>
			</c:if>
		</span>
	</c:forEach>
	<c:if test="${page.next}">
		<span> <a
			href="/community/communityList?category=${param.category}&listPageNum=${page.endPageNum + 1}${page.searchTypeKeyword}">&raquo;</a>
		</span>
	</c:if>
</div>
<script>
$(document).ready(function () {
    $('#side-menu ul li a').first().addClass('selected');
    $('#side-menu ul li a').hover(
        function () {
            $(this).css({ 'background-color': '#00d3ff', 'color': '#fff' });
        },
        function () {
            if (!$(this).hasClass('selected')) {
                $(this).css({ 'background-color': '#e5e5e5', 'color': '#777777' });
            }
        }
    );
    $('#side-menu ul li a').click(function (e) {
        $('#side-menu ul li a.selected').removeClass('selected')
            .css({ 'background-color': '#e5e5e5', 'color': '#777777' });

        $(this).addClass('selected');
        window.localStorage.setItem('selectedCategory', $(this).attr('href'));

        return true;
    });
});
$(document).ready(function () {
    let selectedCategory = window.localStorage.getItem('selectedCategory');
    if (selectedCategory) {
        $('a[href="' + selectedCategory + '"]').addClass('selected');
    } else {
        $('#side-menu ul li a').first().addClass('selected');
    }
});
</script>


