<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>

<head>
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header"
   content="${_csrf.headerName}" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
   href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Noto+Sans+KR:wght@300;700&family=Quicksand:wght@600&display=swap"
   rel="stylesheet">
<link rel="stylesheet" href="${path}/resources/css/artist_detail.css" />
<script src="https://code.jquery.com/jquery-3.7.1.js"
   integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
   crossorigin="anonymous"></script>
<title>아티스트 상세</title>
</head>


<body>
    <div id="board-catetory">
        <input type="hidden" id="${detailArtist.artist_idx}" name="${detailArtist.artist_idx}"> <a>아티스트</a> <a>></a>
        <a class="artiName">${detailArtist.artist_name}</a>
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

                <c:choose>
                    <c:when test="${hashMap.member_idx ne null}">
                        <a href='javascript: like_func();'><img src="${path}/resources/img/empty_heart.png"
                                id='like_img'></a>
                    </c:when>
                    <c:otherwise>
                        <a href='javascript: login_need();'><img src="${path}/resources/img/heart.png"></a>
                    </c:otherwise>
                </c:choose>
                <a href="" onclick="clip(); return false;"><img src="${path}/resources/img/share.png" alt="welp"></a>
                <img src="${path}/resources/img/home.png" alt="welp">
            </div>
        </div>
    </div>
    <div id="reply">
        <p>댓글목록▼</p>
        <p>등록된 댓글이 없습니다.</p>
        <c:forEach items="${reply}" var="reply">
        <div id="replyList">
            <div id="perReply">
                <p id="replyid">${reply.member_name}</p>
                <p id="replycontents">${reply.reply_content}</p>
            </div>
            <div id="replyAdditional">
                <a id="replyEdit">수정</a><span>&nbsp;|&nbsp;</span><a id="replyDelete"> 삭제</a>
                <p id="replyDate">${reply.reply_creationDate}</p>
            </div>
        </div>
        </c:forEach>
        <div class="replyWrite">
         <input type="hidden" name="${_csrf.parameterName}"
            value="${_csrf.token}">
         <sec:authentication var="category"
            property="principal.member.member_category" />

         <label>글쓴이 : </label> <input type="text" id="member_name"
            name="member_name" value="${hashMap.member_loginId}"> <label>내용
            : </label>
      </div>
      <textarea placeholder="
	   댓글 내용을 입력해주세요.
	   (무분별한 악의적 댓글 및 허위 사실 유포성 댓글을 통보없이 삭제될 수 있습니다.)" id="reply_content" name="reply_content" rows="20" cols="50"></textarea>
      <input type="hidden" name="artist_idx" id="artist_idx"
         value="${detailArtist.artist_idx}">
      <button id="replybtn" onclick="writerReply()">댓글 달기</button>
    </div>
    <!-- 	<hr> -->
    <div class="yeogi">
        <div id="categories">
            <div class="category" id="category1" onclick="showContent('gallery',this)">작품</div>
            <div class="category" id="category2" onclick="showContent('career',this)">경력/이력</div>
            <div class="category" id="category3" onclick="showContent('intro',this)">작가소개</div>
        </div>
        <div id="galleryContent">
		  <c:forEach var="detail" items="${detailPicture}">
		    <div class="image-container">
		      <a href="/artist/updatePicture?picture_idx=${detail.picture_idx}">
		        <img src="${detail.picture_file}" class="artImg">
		      </a>
		      <div class="image-details">
		        <p class="gallery_title">${detail.picture_title}</p>
		        <p>${detail.picture_size}</p>
		        <p>${detail.picture_supplies}</p>
		      </div>
		    </div>
		  </c:forEach>
		</div>	
        <div id="careerContent" style="display: none;">
            <p>${detailArtist.artist_career}</p>
        </div>

        <div id="introContent" style="display: none;">
            <p>${detailArtist.artist_note }</p>
        </div>
    </div>
 <div class="edit">
        <sec:authorize access="isAuthenticated() and hasRole('ROLE_ADMIN')">
            <a href="<c:url value='/artist/registrationWork?artist_idx=${detailArtist.artist_idx}'/>">작품등록</a>
        </sec:authorize>
    </div>
	<div class="list">
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

    window.onload = function () {
        const defaultCategory = document.getElementById('category1');
        showContent('gallery', defaultCategory);
    };

    function clip() {

        var url = '';
        var textarea = document.createElement("textarea");
        document.body.appendChild(textarea);
        url = window.document.location.href;
        textarea.value = url;
        textarea.select();
        document.execCommand("copy");
        document.body.removeChild(textarea);
        alert("URL이 복사되었습니다.")
    }

    var images = ["${path}/resources/img/empty_heart.png",
        "${path}/resources/img/heart.png"];
    var currentImageIndex = 0;

    function shakeImage() {
        var img = document.getElementById("myImage");
        currentImageIndex = (currentImageIndex + 1) % images.length;

        // 이미지 흔들기 애니메이션 적용
        img.style.animation = "shake 0.5s ease-in-out"; // 0.5초 동안 흔들기 애니메이션
        img.src = images[currentImageIndex];

        // 애니메이션이 끝나면 다시 초기 상태로 복원
        img.addEventListener("animationend", function () {
            img.style.animation = "none"; // 애니메이션 제거
        });
    }
    function writerReply() {
        var writer = document.getElementById("member_name").value;
        var content = document.getElementById("reply_content").value;
        var board = document.getElementById("artist_idx").value;

        var csrfToken = $("#_csrf").attr("content");
        var csrfHeader = $("#_csrf_header").attr("content");

        $.ajax({
                 type : "post",
                 url : "/reply/write",
                 contentType : "application/json; charset=utf-8",
                 data : JSON.stringify({
                    member_name : writer,
                    reply_content : content,
                    artist_idx : board
                 }),
                 dataType : "json",
                 beforeSend : function(xhr) {
                    var csrfToken = $("meta[name='_csrf']").attr("content");
                    var csrfHeader = $("meta[name='_csrf_header']").attr(
                          "content");
                    xhr.setRequestHeader(csrfHeader, csrfToken);
                 },
                 success : function(replyList) {
                    location.reload();
                    console.log("성공");
                 },
                 error : function(jqXHR, textStatus, errorThrown) {
                    console.log("HTTP Status: " + jqXHR.status);
                    console.log("Ajax Error Text: " + textStatus);
                    console.log("Error Thrown: " + errorThrown);
                 }
              });
     }




</script>

</html>