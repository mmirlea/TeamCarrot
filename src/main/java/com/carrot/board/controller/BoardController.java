package com.carrot.board.controller;

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
		try {
			BoardDTO boardDTO = service.read(0);
			m.addAttribute(boardDTO);
			m.addAttribute("page", page);
			m.addAttribute("pageSize", pageSize);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "boardMain";
	}

}
