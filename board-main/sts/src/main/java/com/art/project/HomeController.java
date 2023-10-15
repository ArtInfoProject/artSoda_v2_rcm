package com.art.project;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	
	// 홈화면
	@GetMapping(value = "/")
	public String home() {
		return "tiles/homepage";
	}

	// 로그인
	@GetMapping("login")
	public String login() {
		return "member/loginForm";
	}

	// 로그아웃
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		if (session != null) {
			session.invalidate();
		}
		return "redirect:/";
	}

}
