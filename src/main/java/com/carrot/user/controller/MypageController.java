package com.carrot.user.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.carrot.board.domain.PageHandlerM;
import com.carrot.board.domain.ProductDTO;
import com.carrot.board.domain.SearchConditionM;
import com.carrot.board.service.ProductService;
import com.carrot.user.domain.UserDTO;
import com.carrot.user.service.UserService;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	UserService service;
	
	@GetMapping("/home")
	public String mypage(Model m, UserDTO dto, HttpServletRequest request, SearchConditionM scm) {

		if(!loginCheck(request))
			return "redirect:/login/login?toURL=" + request.getRequestURI();
		
		try {
			HttpSession session = request.getSession();
			
			dto = service.mypageInfo((String) session.getAttribute("m_email"));
			
			System.out.println(dto.toString());
			
			m.addAttribute("dto", dto);
			
			int totalCnt = service.getCount();
			System.out.println("getCount:" + totalCnt);
			
			PageHandlerM pageHandlerM = new PageHandlerM(totalCnt, scm);
			System.out.println(pageHandlerM);
			
			List<ProductDTO> list = service.getPage(scm);
			System.out.println("list" + list);
			
			m.addAttribute("listM", list);
			m.addAttribute("phm", pageHandlerM);
			
		} catch (Exception e) {
			e.printStackTrace();
			e.printStackTrace();
			m.addAttribute("msg", "LIST_ERR");
			m.addAttribute("totalCnt", 0);
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
	
	@PostMapping("/modify/pw")
	public String modifyPw(UserDTO dto, RedirectAttributes rattr, HttpSession session, Model m) {
		String m_email = (String) session.getAttribute("m_email");
		
		dto.setM_email(m_email);
		
		try {
			if(service.modifyPw(dto) != 1)
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
	
	@PostMapping("/modify/addr")
	public String modifyAddr(UserDTO dto, RedirectAttributes rattr, HttpSession session, Model m) {
		String m_email = (String) session.getAttribute("m_email");
		
		dto.setM_email(m_email);
		
		try {
			if(service.modifyAddr(dto) != 1)
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
	
//	//마이페이지 - 중고물품 게시글 목록 출력
//	@GetMapping("/home")
//	public String myList(Model m, SearchConditionP scp) {
//		try {
//			int totalCnt = serviceP.getCount();
//			
//			System.out.println("getCount:" + totalCnt);
//			PageHandlerP pageHandlerP = new PageHandlerP(totalCnt, scp);
//			System.out.println("pageHandlerP" + pageHandlerP);
//			
//			List<ProductDTO> list = serviceP.getPage(scp);
//			System.out.println("list" + list);
//			
//			/* List<ProductDTO> list = service.selectAll(); */
//			
//			m.addAttribute("list", list);
//			m.addAttribute("ph", pageHandlerP);
//			
//		}catch(Exception e) {
//			e.printStackTrace();
//			m.addAttribute("msg", "LIST_ERR");
//			m.addAttribute("totalCnt", 0);
//		}
//		
//		return "myPage";
//	}
	
}
