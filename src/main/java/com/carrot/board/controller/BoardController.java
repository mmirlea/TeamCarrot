package com.carrot.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.carrot.board.domain.BoardDTO;
import com.carrot.board.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	BoardService service;

	@GetMapping("/read")
	public String read(Integer b_num, Integer page, Integer pageSize, Model m) {

		System.out.println("test!!");

//		try {
//			BoardDTO boardDTO = service.read(b_num);
//
//			m.addAttribute("boardDTO", boardDTO);
//
//			m.addAttribute("page", page);
//			m.addAttribute("pageSize", pageSize);
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}

		return "board";
	}

	// 로그인 여부 확인
	private boolean loginCheck(HttpServletRequest request) {
		System.out.println("test22");
		HttpSession session = request.getSession();
		return session.getAttribute("id") != null;
	}

}
