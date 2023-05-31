package com.carrot.user.controller;

import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.carrot.user.domain.UserDTO;
import com.carrot.user.service.UserService;

@Controller
public class RegisterController {
	@Autowired
	UserService service;
	
	@GetMapping("/register/add")
	public String register() {
		return "join";
	}
	
	//회원가입처리
	@PostMapping("/register/save")
	public String save(UserDTO dto, Model m) throws Exception{
		//유효성 검사
		if(!isValid(dto)) {
			String msg = URLEncoder.encode("중복된 이메일입니다.", "UTF-8");
			
			m.addAttribute("msg", msg);
			return "redirect:/register/add";
		}
		
		int result = emailOverlap(dto);
		
		if(result != 0) {
			return "redirect:/register/add";
		}
		
		//회원가입 실행
		service.register(dto);
		
		m.addAttribute("msg", "회원가입이 완료되었습니다.");
		m.addAttribute("url", "/carrot");
		
		return "alertPrint";
	}
	
	//이메일 중복
	@ResponseBody
	@PostMapping("/register/emailOverlap")
	public int emailOverlap(UserDTO dto) throws Exception{
		int result = service.emailOverlap(dto);
		return result;
	}
	
	//유효성 검사 메서드
	private boolean isValid(UserDTO user) {
		return true;
	}
}
