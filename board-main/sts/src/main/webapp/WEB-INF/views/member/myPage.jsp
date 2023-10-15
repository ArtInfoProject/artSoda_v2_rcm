<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link rel="stylesheet" href="${path}/resources/css/myPage.css">
<title>마이페이지</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous">
	
</script>
<script type="text/javascript">
	function updateMember() {
		var updateConfirm = confirm('수정하시겠습니까?');
		if (updateConfirm) {
			$('#myPage').submit();
		}
	}

	function deleteMember() {
		var deleteConfirm = confirm('탈퇴를 하시겠습니까?');
		if (deleteConfirm) {
			location.href = "/member/auth/delete";
		}
	}
</script>
<section id="container">
	<div id="contents">
		<h4 class="tle_h4">회원정보 수정</h4>
		<form id="myPage" action="/member/auth/update" method="post">

			<div class="inner_contents">
				<input type="hidden"
					value="<sec:authentication property="principal.member.member_idx"/>"
					id="member_idx" name="member_idx" />
				<p class="message">【 회원정보를 수정 할 수 있습니다. 】</p>
				<!-- 아이디 -->
				<div class="contents_row">
					<label for="user_id" class="label-myPage"><em>▪︎</em>아이디</label> <input
						id="usr_id" name="member_loginId" class="form" readonly="readonly"
						type="text"
						value="<sec:authentication property="principal.member.member_loginId"/>">
				</div>

				<!-- 이름 -->
				<div class="contents_row">
					<label for="name" class="label-myPage"><em>▪︎</em>이름</label> <input
						id="name" name="member_name" title="성명" class="form"
						readonly="readonly" type="text"
						value="<sec:authentication property="principal.member.member_name"/>" />
				</div>


				<!-- 휴대폰 번호 -->
				<div class="contents_row">
					<div class="class="form-col">
						<label for="tel" class="label-myPage"><em>▪︎</em>휴대폰</label>
						<sec:authentication var="tel"
							property="principal.member.member_tel" />
						<select class="form-callphone" id="mobileNo_1" name="mobileNo_1"
							title="휴대폰 앞자리">
							<option value="010"
								${fn:substring(tel, 0, 3) == '010' ? 'selected' : '' }>010</option>
							<option value="011"
								${fn:substring(tel, 0, 3) == '011' ? 'selected' : '' }>011</option>
							<option value="016"
								${fn:substring(tel, 0, 3) == '016' ? 'selected' : '' }>016</option>
							<option value="017"
								${fn:substring(tel, 0, 3) == '017' ? 'selected' : '' }>017</option>
							<option value="018"
								${fn:substring(tel, 0, 3) == '018' ? 'selected' : '' }>018</option>
							<option value="019"
								${fn:substring(tel, 0, 3) == '019' ? 'selected' : '' }>019</option>
						</select> <input id="mobileNo_2" name="mobileNo_2" title="전화번호 앞자리"
							name="member_tel" class="form-control_col" type="text"
							value="${fn:substring(tel, 3, 7)}" maxlength="4" /> <input
							id="mobileNo_3" name="mobileNo_3" title="전화번호 뒷자리"
							name="member_tel" class="form-control_col" type="text"
							value="${fn:substring(tel, 7, 11)}" maxlength="4" />
					</div>
				</div>
				<!-- 이메일 -->
				<div class="contents_row">
					<label for="mail" class="label-myPage"> <em>▪︎</em>이메일 ::
					</label> <input id="email" title="이메일" name="member_email" class="form"
						type="text"
						value="<sec:authentication property="principal.member.member_email"/>" />
				</div>


				<!-- 가입유형 -->
				<div class="contents_row">
					<label for="subscription_type" class="label-myPage"> <em>▪︎</em>가입유형
						::
					</label>
					<sec:authentication var="category"
						property="principal.member.member_category" />
					<c:choose>
						<c:when test="${category eq 'regular'}">
							<input id="subscription_individual" value="regular"
								class="form-check-input" type="radio" name="member_category"
								checked disabled />
							<label for="subscription_individual">개인회원</label>

							<input id="subscription_corporate" value="company"
								class="form-check-input" type="radio" name="member_category"
								disabled />
							<label for="subscription_corporate">기업회원</label>
						</c:when>
						<c:otherwise>
							<input id="subscription_individual" value="regular"
								class="form-check-input" type="radio" name="member_category"
								disabled />
							<label for="subscription_individual">개인회원</label>

							<input id="subscription_corporate" value="company"
								class="form-check-input" type="radio" name="member_category"
								checked disabled />
							<label for="subscription_corporate">기업회원</label>
						</c:otherwise>
					</c:choose>
				</div>
				<!-- 버튼  -->
				<div class="btn_myPage">
					<a class="btn_submit btn btn01" onclick="updateMember()">개인정보
						변경</a> <a class="btn_secession btn btn03" onclick="deleteMember()">회원
						탈퇴</a> <a class="btn_cancel btn btn02" onclick="location.href='/'">취소</a>
				</div>

			</div>
	</div>
	<div>
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
		</form>
	</div>
</section>