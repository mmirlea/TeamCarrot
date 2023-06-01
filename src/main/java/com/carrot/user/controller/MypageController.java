package com.carrot.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.carrot.user.domain.UserDTO;
import com.carrot.user.service.UserService;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	UserService service;
	
	@GetMapping("/home")
	public String mypage(Model m, UserDTO dto, HttpServletRequest request) {

		if(!loginCheck(request))
			return "redirect:/login/login?toURL=" + request.getRequestURI();
		
		try {
			HttpSession session = request.getSession();
			
			dto = service.mypageInfo((String) session.getAttribute("m_email"));
			
			System.out.println(dto.toString());
			
			m.addAttribute("dto", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
			return "myPage";

	}
	
	@GetMapping("/myprofile")
	public String myprofile(Model m, UserDTO dto, HttpServletRequest request) {
		try {
			HttpSession session = request.getSession();
			
			dto = service.mypageInfo((String) session.getAttribute("m_email"));
			
			System.out.println(dto.toString());
			
			m.addAttribute("dto", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
			return "myProfile";
		
	}
	
	//프로필 수정
	@PostMapping("/modify")
	public String modify(UserDTO dto, RedirectAttributes rattr, HttpSession session, Model m) {
		String m_email = (String) session.getAttribute("m_email");
		
		dto.setM_email(m_email);
		
		try {
			if(service.modify(dto) != 1)
				throw new Exception("Modify failed");
			
			rattr.addFlashAttribute("msg", "프로필 수정 실패");
			
			return "redirect:/mypage/myprofile";
		} catch (Exception e) {
			e.printStackTrace();
			
			m.addAttribute("dto", dto);
			m.addAttribute("msg", "프로필 수정 완료");
			
			return "myProfile";
		}
	}
	
	//로그인 여부 확인
	private boolean loginCheck(HttpServletRequest request) {
			 
			//1) 세션을 가져오기
			HttpSession session = request.getSession();
			
			//2) 세션에 id가 있는지 확인
			return session.getAttribute("m_email") != null;

		}
}
