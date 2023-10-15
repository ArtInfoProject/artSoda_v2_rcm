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
<title>전시회 글 수정</title>
</head>
<script>
	
</script>
<body>
	<div id="writeBody">
		<form action="/exhibition/update?exhibition_idx=${detail.exhibition_idx}" method="post"  enctype="multipart/form-data">
			<div id="board-catetory">
				<p>전시회 글수정</p>
			</div>
			<div>
				<label>글 번호 : ${detail.exhibition_idx}</label>
			</div>
			<div>
				<label>분류 : </label> <select name="exhibition_category"
					id="exhibition_category">
					<option value="exhibitionCategory">선택하세요</option>
					<option value="개인전"
						${detail.exhibition_category == '개인전' ? 'selected' : '' }>개인전</option>
					<option value="단체전"
						${detail.exhibition_category == '단체전' ? 'selected' : '' }>단체전</option>
				</select>
			</div>
			<label> 전시회 제목 : </label> <input type="text" id="exhibition_title"
				name="exhibition_title" value="${detail.exhibition_title}">
			<div>
			<div>
				<label>작가명 : </label><input type="text" id="exhibition_writer"
					name="exhibition_writer" value="${detail.exhibition_writer} ">
			</div>
				<label>전시회 관련링크 : </label> 
				<input type="url" id="exhibition_url"
					name="exhibition_url" value="${detail.exhibition_url}">
			</div>
			<div>
				<label>전시회 일정 : </label>
				<div class="date-range">
					<input type="date" name="exhibition_start" id="exhibition_start"
						value="${detail.exhibition_start }"><span>&nbsp;~&nbsp;</span><input
						type="date" name="exhibition_end" id="exhibition_end"
						value="${detail.exhibition_end }">
				</div>
			</div>
			<div>
				<label>전시회 지역 : </label> <select name="exhibition_region"
					id="exhibition_region">
					<option value="">선택하세요</option>
					<option value="서울특별시"
						${detail.exhibition_region == '서울특별시' ? 'selected' : '' }>서울특별시</option>
					<option value="경기도"
						${detail.exhibition_region == '경기도' ? 'selected' : '' }>경기도</option>
					<option value="세종특별자치시"
						${detail.exhibition_region == '세종특별자치시' ? 'selected' : '' }>세종특별자치시</option>
					<option value="인천광역시"
						${detail.exhibition_region == '인천광역시' ? 'selected' : '' }>인천광역시</option>
					<option value="대전광역시"
						${detail.exhibition_region == '대전광역시' ? 'selected' : '' }>대전광역시</option>
					<option value="부산광역시"
						${detail.exhibition_region == '부산광역시' ? 'selected' : '' }>부산광역시</option>
					<option value="대구광역시"
						${detail.exhibition_region == '대구광역시' ? 'selected' : '' }>대구광역시</option>
					<option value="광주광역시"
						${detail.exhibition_region == '광주광역시' ? 'selected' : '' }>광주광역시</option>
					<option value="울산광역시"
						${detail.exhibition_region == '울산광역시' ? 'selected' : '' }>울산광역시</option>
					<option value="강원특별자치도"
						${detail.exhibition_region == '강원특별자치도' ? 'selected' : '' }>강원특별자치도</option>
					<option value="충청북도"
						${detail.exhibition_region == '충청북도' ? 'selected' : '' }>충청북도</option>
					<option value="충청남도"
						${detail.exhibition_region == '충청남도' ? 'selected' : '' }>충청남도</option>
					<option value="전라북도"
						${detail.exhibition_region == '전라북도' ? 'selected' : '' }>전라북도</option>
					<option value="전라남도"
						${detail.exhibition_region == '전라남도' ? 'selected' : '' }>전라남도</option>
					<option value="경상북도"
						${detail.exhibition_region == '경상북도' ? 'selected' : '' }>경상북도</option>
					<option value="경상남도"
						${detail.exhibition_region == '경상남도' ? 'selected' : '' }>경상남도</option>
					<option value="제주특별자치도"
						${detail.exhibition_region == '제주특별자치도' ? 'selected' : '' }>제주특별자치도</option>
				</select>
			</div>
			<div>
				<label>전시회 장소 : </label> <input type="text"
					name="exhibition_location" id="exhibition_location"
					value="${detail.exhibition_location}">
			</div>
			<div class="editable" contenteditable="true">
			<label>전시회 내용 : </label>
			<textarea name="exhibition_contents" rows="500">${detail.exhibition_contents }</textarea>
			</div>
			<div>
				<label>전시회 image : </label>
					<input type="file" id="exhibition_img" name="file" />
				<div class="select_img">
					<img src="${detail.exhibition_img}" class="oriImg"/>					
					<input type="hidden" name ="exhibition_img" value="${detail.exhibition_img}"/>
					<input type="hidden" name ="exhibitionThumbImg" value="${detail.exhibitionThumbImg}"/>
				</div>
				
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
					<%-- 				<%=request.getRealPath("/") %> --%>
			</div>
			<div class="button-container">
				<button type="reset">다시쓰기</button>
				<button type="submit">제출</button>
				<button type="button"
					onclick="location.href='/exhibition/exhibitionList?listPageNum=1';">취소</button>
			</div>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}">
		</form>
	</div>
	<!-- name 속성은 스크립트단에서 id 속성은 Server단에서 주로 사용된다. -->
</body>
<script>
$('.editable').each(function(){
    this.contentEditable = true;
});
</script>
</html>