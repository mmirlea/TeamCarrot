package com.carrot.user.controller;

import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.carrot.user.domain.UserDTO;
import com.carrot.user.service.UserService;

@Controller
@RequestMapping("/login")
public class LoginController {
	@Autowired
	UserService service;
	
	@GetMapping("/login")
	public String loginForm() {
		return "login";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@PostMapping("/login")
	public String login(UserDTO dto, String toURL, boolean rememberId, HttpServletResponse response, HttpServletRequest request) throws Exception {
		
		if(!loginCheck(dto)) {
			String msg = URLEncoder.encode("id 또는 pw가 일치하지 않습니다.", "UTF-8");
			return "redirect:/login/login?msg="+msg;
		}
		
		System.out.println(dto.toString());
		
		HttpSession session = request.getSession();
		
		session.setAttribute("m_email", dto.getM_email());
		
		if(rememberId) {
			Cookie cookie = new Cookie("m_email", dto.getM_email());
			
			response.addCookie(cookie);
		} else {
			Cookie cookie = new Cookie("m_email", dto.getM_email());
			cookie.setMaxAge(0);
			
			response.addCookie(cookie);
		}
		
		toURL = toURL == null || toURL.equals("") ? "/" : toURL;
		
		return "redirect:/";
		
	}
	
	private boolean loginCheck(UserDTO dto) {
		try {
			UserDTO check = service.login(dto);
			
			if(check == null) 
				throw new Exception("login Err");
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
	}
}
