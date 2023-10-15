<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/resources/css/write.css" />
<title>커뮤니티 글 쓰기</title>
</head>
<body>
	<div id="writeBody">
		<form action="/community/write" method="post" enctype="multipart/form-data">
			<div id="board-catetory">
				<p>커뮤니티 글쓰기</p>
			</div>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}">
			<sec:authentication var="category"
				property="principal.member.member_category" />
			<c:choose>
				<c:when test="${category eq 'company'}">
					<div>
						<label>카테고리</label> <select name="community_category"
							id="community_category">
							<option value="">선택하세요</option>
							<option value="광고홍보">광고홍보</option>
							<option value="구인구직">구인구직</option>
							<option value="중고장터">중고장터</option>
						</select>
					</div>
				</c:when>
				<c:otherwise>
					<div>
						<label>카테고리</label> <select name="community_category"
							id="community_category">
							<option value="">선택하세요</option>
							<option value="광고홍보">광고홍보</option>
							<option value="중고장터">중고장터</option>
						</select>
					</div>
				</c:otherwise>
			</c:choose>
			<div>
				<label>제목</label> <input type="text" id="community_title"
					name="community_title">
			</div>
			<div>
				<label>내용</label>
				<textarea rows="20" cols="50" id="community_contents"
					name="community_contents"></textarea>
			</div>
			<div>
				<label>관련링크</label>
				<input type="url" name="community_url">
			</div>
			<div>
				<label>이미지</label>
				<input type="file" id="community_file" name="file" />
				<div class="select_img"><img src="" class="oriImg"/></div>
				
				<script>
					$("#community_file").change(function(){
						if(this.files && this.files[0]) {
							var reader = new FileReader;
							reader.onload = function(data) {
								$(".select_img img").attr("src", data.target.result).width(500);								
							}
							reader.readAsDataURL(this.files[0]);
						}
					});
				</script>
				
				<%=request.getRealPath("/") %>
				
			</div>
			<div>
				<button type="submit" id="register_Btn" class="btn btn-primary">등록</button>
			</div>
			
			<div class="button-container">
				<button type="reset">다시쓰기</button>
				<button type="submit">제출</button>
				<button type="button" onclick="history.back();">취소</button>
			</div>
		</form>
	</div>
</body>
</html>