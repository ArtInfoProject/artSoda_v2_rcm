<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>작품등록</title>
    <link
        href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Noto+Sans+KR:wght@300;700&family=Quicksand:wght@600&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="${path}/resources/css/write.css" />
</head>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

<body>
    <div id="writeBody">
        <form action="/artist/registrationWork" method="post" enctype="multipart/form-data">
            <div id="board-catetory">
                <p>작품등록</p>
            </div>
            <div>
                <label>작품 제목 : </label><input type="text" id="picture_title" name="picture_title">
                <label>작품 size : </label><input type="text" id="picture_size" name="picture_size">
                <label>작품 재료 : </label><input type="text" id="picture_supplies" name="picture_supplies">
                <label>전시회 image : </label> <input type="file" id="picture_file" name="file">
                <input type="hidden" id="artist_idx" name="artist_idx" value="${param.artist_idx}">
                <div class="select_img"><img src="" class="oriImg" /></div>
                <script>
                    $("#picture_file").change(function () {
                        if (this.files && this.files[0]) {
                            var reader = new FileReader;
                            reader.onload = function (data) {
                                $(".select_img img").attr("src", data.target.result).width(500);
                            }
                            reader.readAsDataURL(this.files[0]);
                        }
                    });
                </script>
            </div>
            <div class="button-container">
                <button type="reset">다시쓰기</button>
                <button type="submit">제출</button>
                <button type="button" onclick="history.back();">취소</button>
            </div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        </form>
    </div>
    <!-- name 속성은 스크립트단에서 id 속성은 Server단에서 주로 사용된다. -->
</body>

</html>