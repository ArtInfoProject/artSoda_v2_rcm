package com.art.project.member.handler;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;

public class CustomAuthenticationEntryPoint implements AuthenticationEntryPoint{ // 인증이 안되었을때(로그인이 필요할때)

	@Override
	public void commence(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException authException) throws IOException, ServletException {
		  response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
		    out.println("<script>");
		    out.println("alert('인증이 팔요합니다.')");
		    out.println("history.back()");
		    out.println("</script>");
		    out.flush();
		    out.close();
		
	}

}
