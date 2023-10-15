package com.art.project.member.handler;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomAccessDeniedHandler implements AccessDeniedHandler { // 인증은 되었지만 권한이 없는 사용자

  @Override
  public void handle(HttpServletRequest request, 
      HttpServletResponse response, AccessDeniedException accessException)
      throws IOException, ServletException {

	  response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
	    out.println("<script>");
	    out.println("alert('접근 권한이 없습니다.')");
	    out.println("history.back()");
	    out.println("</script>");
	    out.flush();
	    out.close();

  }

}
