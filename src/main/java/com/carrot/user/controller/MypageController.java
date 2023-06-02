package com.carrot.user.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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
	public String modify(@ModelAttribute UserDTO dto, @RequestParam("imageFile") MultipartFile imageFile, HttpSession session, Model m) {
		
		String m_email = (String) session.getAttribute("m_email");
		
		dto.setM_email(m_email);
		
		try {
		    if (imageFile != null && !imageFile.isEmpty()) {
		        String fileName = saveImageToServer(imageFile);
		        dto.setM_proimg(fileName);
		        if (service.modify(dto) != 1) {
		            throw new Exception("Modify failed");
		        }
		    } else {
		        if (service.modNoImg(dto) != 1) {
		            throw new Exception("Modify failed");
		        }
		    }

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
	
	//삭제
	@PostMapping("/userDel")
	public String userDel(UserDTO dto, HttpSession session, Model m) {
		String m_email = (String) session.getAttribute("m_email");
		
		dto.setM_email(m_email);
		try {
			if(service.delUser(dto) != 1)
				throw new Exception("Modify failed");
			
			return "redirect:/login/logout";
			
			
		} catch (Exception e) {
			e.printStackTrace();
			
			m.addAttribute("dto", dto);
			m.addAttribute("msg", "탈퇴 실패");
			
			return "alertPrint";
		}
	}
	
	//로그인 여부 확인
	private boolean loginCheck(HttpServletRequest request) {
			 
			//1) 세션을 가져오기
			HttpSession session = request.getSession();
			
			//2) 세션에 id가 있는지 확인
			return session.getAttribute("m_email") != null;

		}
	
	//파일명 저장 위치, 이름 지정
	public static String saveImageToServer(MultipartFile file) throws IOException {
        String uploadDir = "D:/01-STUDY/proimg/";
        //String uploadDir = "src/main/resources/static/images/";
        
        // 디렉토리가 존재하지 않으면 생성
        File directory = new File(uploadDir);
        if (!directory.exists()) {
            directory.mkdirs();
        }

        String originalFilename = StringUtils.cleanPath(file.getOriginalFilename());
        String fileName = System.currentTimeMillis() + "_" + originalFilename;
        String filePath = uploadDir + fileName;

        // 파일 저장
        File dest = new File(filePath);
        file.transferTo(dest);

        return fileName;
    }
}
