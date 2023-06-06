package com.carrot.user.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	public String save(@ModelAttribute UserDTO dto, @RequestParam("imageFile") MultipartFile imageFile, Model m) throws Exception{
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
		
		// 이미지 저장
	    String fileName = null;
	    if (imageFile != null && !imageFile.isEmpty()) {
	        try {
	            fileName = saveImageToServer(imageFile);
	        } catch (IOException e) {
	            e.printStackTrace();
	            // 예외 처리
	            m.addAttribute("msg", "이미지 업로드에 실패하였습니다.");
	            return "redirect:/register/add";
	        }
	    }
	    dto.setM_proimg(fileName);
	    
	    // 회원가입 실행
	    try {
	        service.register(dto);
	        m.addAttribute("msg", "회원가입이 완료되었습니다.");
	        m.addAttribute("url", "/carrot/login/login");
	        return "alertPrint";
	    } catch (Exception e) {
	        e.printStackTrace();
	        // 회원가입 실패 시 예외 처리
	        m.addAttribute("msg", "회원가입에 실패하였습니다.");
	        return "redirect:/register/add";
	    }
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
	
	//이미지 경로
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

