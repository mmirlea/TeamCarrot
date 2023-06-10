package com.carrot.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.carrot.board.domain.LikeyDTO;
import com.carrot.board.service.LikeyService;

@Controller
public class LikeyController {

	@Autowired
	LikeyService service;

	@GetMapping("/like")
	public String insertLike(LikeyDTO likeyDTO, Model m, HttpSession session, HttpServletRequest request) {
		String l_email = (String) session.getAttribute("m_email");
		likeyDTO.setL_email(l_email);
		
		try {
			if (service.insertLike(likeyDTO) != 1) {
				System.out.println("좋아요 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "boardDetail";
	}
	
	@GetMapping("/disLike")
	public String deleteLike(LikeyDTO likeyDTO, Model m, HttpSession session, HttpServletRequest request) {
		String l_email = (String) session.getAttribute("m_email");
		likeyDTO.setL_email(l_email);
		
		try {
			if (service.deleteLike(likeyDTO) != 1) {
				System.out.println("좋아요 취소 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "boardDetail";
	}
}
