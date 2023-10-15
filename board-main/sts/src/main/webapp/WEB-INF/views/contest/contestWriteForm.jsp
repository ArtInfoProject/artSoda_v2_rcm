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
<link rel="stylesheet" href="${path}/resources/css/write.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>공모전 글쓰기</title>
</head>
<body>
	<div id="writeBody">
		<form action="/contest/write" method="post" enctype="multipart/form-data">
			<div id="board-catetory">
				<p>공모전 등록</p>
			</div>
			<div>
				<label>공모전 제목 : </label><input type="text" id="contest_title"
					name="contest_title">
			</div>
			<div>
				<label>공모전 관련링크 : </label> <input type="url" id="contest_url"
					name="contest_url">
			</div>
			<div>
				<label>공모전 일정 : </label>
				<div class="date-range">
					<input type="date" name="contest_start" id="contest_start">
					<span>&nbsp;~&nbsp;</span> <input type="date" name="contest_end"
						id="contest_end">
				</div>
			</div>
			<div>
				<label>공모전 지역 : </label> <select name="contest_region"
					id="contest_region">
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
				</select> 
				<label>공모전 장소 : </label> <input type="text" name="contest_location"
					id="contest_location">
			</div>
			<div>
				<label>공모전 내용 : </label>
				<textarea name="contest_contents" id="contest_contents" rows="20"
					cols="50"></textarea>
			</div>
<!-- 			<div> -->
<!-- 							<label>공모전 image : </label> <input type="file" id="contest_file" name="contest_file" accept=".jpg,.png"> -->
<!-- 				<label>공모전 image : </label> <input type="text" id="contest_file" -->
<!-- 					name="contest_file" accept=".jpg,.png"> -->
<!-- 			</div> -->
			<div>
				<label>공모전 이미지 : </label>
				<input type="file" id="contest_file" name="file" />
				<div class="select_img"><img src="" class="oriImg"/></div>
				
				<script>
					$("#contest_file").change(function(){
						if(this.files && this.files[0]) {
							var reader = new FileReader;
							reader.onload = function(data) {
								$(".select_img img").attr("src", data.target.result).width(500);								
							}
							reader.readAsDataURL(this.files[0]);
						}
					});
				</script>
				
<%-- 				<%=request.getRealPath("/") %> --%>
				
			</div>
			<div class="button-container">
				<button type="reset">다시쓰기</button>
				<button type="submit">제출</button>
				<button type="button" onclick="history.back();">취소</button>
			</div>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}">
		</form>
	</div>
	<!-- name 속성은 스크립트단에서 id 속성은 Server단에서 주로 사용된다. -->
</body>
</html>