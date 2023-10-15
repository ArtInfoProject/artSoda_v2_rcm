package com.art.project.member.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import com.art.project.common.Message;

public class CustomLoginFailureHandler implements AuthenticationFailureHandler {

	@Autowired
	Message msg;
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		// 로그인 실패 시 실행될 코드를 작성합니다.
		// 예를 들어, 실패 횟수 기록, 잠금 처리 등을 수행할 수 있습니다.
		if (exception instanceof BadCredentialsException) {
            // 올바르지 않은 자격 증명 예외 처리
			msg.alert(response, "alert('아이디 또는 비밀번호가 맞지 않습니다. 다시 확인해주세요.');history.back();");
        } else {
            // 기타 예외 처리
        	msg.alert(response, "alert('알 수 없는 오류로 로그인 요청을 처리할 수 없습니다. 관리자에게 문의하세요.');history.back();");
        }

	}

}
