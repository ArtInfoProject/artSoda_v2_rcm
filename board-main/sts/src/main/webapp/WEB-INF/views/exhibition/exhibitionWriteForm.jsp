<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Noto+Sans+KR:wght@300;700&family=Quicksand:wght@600&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${path}/resources/css/write.css" />
<title>전시회 글 쓰기</title>
</head>
<body>
	<div id="writeBody">
		<form action="/exhibition/write" method="post"  enctype="multipart/form-data">
			<div id="board-catetory">
				<p>전시회 글쓰기</p>
			</div>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}">
			<div>
				<label>분류 : </label> <select name="exhibition_category"
					id="exhibition_category">
					<option value="exhibitionCategory">선택하세요</option>
					<option value="개인전">개인전</option>
					<option value="단체전">단체전</option>
				</select>
			</div>
			<div>
				<label>전시회 제목 : </label><input type="text" id="exhibition_title"
					name="exhibition_title">
			</div>
			<div>
				<label>작가명 : </label><input type="text" id="exhibition_writer"
					name="exhibition_writer">
			</div>
			<div>
				<label>전시회 관련링크 : </label> <input type="url" id="exhibition_url"
					name="exhibition_url">
			</div>
			<div>
				<label>전시회 일정 : </label>
				<div class="date-range">
					<input type="date" name="exhibition_start" id="exhibition_start">
					<span>&nbsp;~&nbsp;</span> <input type="date" name="exhibition_end"
						id="exhibition_end">
				</div>
			</div>
			<div>
				<label>전시회 지역 : </label> <select name="exhibition_region"
					id="exhibition_region" id="exhibition_region">
					<option value="">선택하세요</option>
					<option value="서울특별시">서울특별시</option>
					<option value="경기도">경기도</option>
					<option value="세종특별자치시">세종특별자치시</option>
					<option value="인천광역시">인천광역시</option>
					<option value="대전광역시">대전광역시</option>
					<option value="부산광역시">부산광역시</option>
					<option value="대구광역시">대구광역시</option>
					<option value="광주광역시">광주광역시</option>
					<option value="울산광역시">울산광역시</option>
					<option value="강원특별자치도">강원특별자치도</option>
					<option value="충청북도">충청북도</option>
					<option value="충청남도">충청남도</option>
					<option value="전라북도">전라북도</option>
					<option value="전라남도">전라남도</option>
					<option value="경상북도">경상북도</option>
					<option value="경상남도">경상남도</option>
					<option value="제주특별자치도">제주특별자치도</option>
				</select> <label>전시회 장소 : </label> <input type="text"
					name="exhibition_location" id="exhibition_location">
			</div>
			<div>
				<label>전시회 내용 : </label>
				<textarea name="exhibition_contents" id="exhibition_contents"
					rows="20" cols="50"></textarea>
			</div>
			<div>
				<label>전시회 image : </label>
					<input type="file" id="exhibition_img" name="file" />
				<div class="select_img"><img src="" class="oriImg"/></div>
					<script>
					$("#exhibition_img").change(function(){
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
			<div class="button-container">
				<button type="reset">다시쓰기</button>
				<button type="submit">제출</button>
				<button type="button"
					onclick="location.href='/exhibition/exhibitionList?listPageNum=1';">취소</button>
			</div>
		</form>
		<!-- name 속성은 스크립트단에서 id ver단에서 주로 사용된다. -->
	</div>
</body>
</html>