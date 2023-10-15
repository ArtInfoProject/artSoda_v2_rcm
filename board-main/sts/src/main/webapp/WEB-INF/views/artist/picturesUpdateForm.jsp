<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>UPDATE</title>

<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Noto+Sans+KR:wght@300;700&family=Quicksand:wght@600&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="${path}/resources/css/write.css" />
</head>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<body>
	<div id="writeBody">
	<form action="/artist/updatePicture?picture_idx=${detailPicture.picture_idx}" method="post" enctype="multipart/form-data">
		<div id="board-catetory">
			<p>작품 수정</p>
		</div>
		<div>
			<label>작품명 : </label><input type="text" id="picture_title"
				name="picture_title" value="${detailPicture.picture_title}">
		</div>
		<div>
			<label>작품 size : </label><input type="text" id="picture_size"
				name="picture_size" value="${detailPicture.picture_size}">
		</div>
		<div>
			<label>작품 재료 : </label><input type="text" id="picture_supplies"
				name="picture_supplies" value="${detailPicture.picture_supplies}">
		</div>
		<div>
			<label>작품 image : </label> 
			<input type="file" id="picture_file" name="file"/>
				<div class="select_img">
					<img src="${detailPicture.picture_file}" class="oriImg"/>					
					<input type="hidden" name ="picture_file" value="${detailPicture.picture_file}"/>
					<input type="hidden" name ="pictureThumbImg" value="${detailPicture.pictureThumbImg}"/>
				</div>
				
					<script>
						$("#picture_file").change(function(){
							if(this.files && this.files[0]) {
								var reader = new FileReader;
								reader.onload = function(data) {
									$(".select_img img").attr("src", data.target.result).width(500);								
								}
									reader.readAsDataURL(this.files[0]);
								}
							});
					</script>
		
		</div>
		<div class="button-container">
		<button class="del" id="deleteButton">삭제</button>
			<button type="submit">제출</button>
			<button type="button" onclick="history.back();">취소</button>
		</div>
		<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" />
	</form>
	</div>
	<!-- name 속성은 스크립트단에서 id 속성은 Server단에서 주로 사용된다. -->
</body>
<script>
document.getElementById("deleteButton").addEventListener("click", function() {
    window.location.href = "<c:url value='/artist/pictureDelete?picture_idx=${detailPicture.picture_idx}&artist_idx=${detailPicture.artist_idx}'/>";
});
</script>
</html>