package com.carrot.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.carrot.board.domain.BoardDTO;
import com.carrot.board.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	BoardService service;

	@GetMapping("/list")
	public String list(Integer b_num, Integer page, Integer pageSize, Model m) {

		return "boardMain";
	}

	@GetMapping("/write")
	public String write(Integer b_num, Integer page, Integer pageSize, Model m) {

		return "boardDetail";
	}

	@GetMapping("/read")
	public String read(Integer b_num, Integer page, Integer pageSize, Model m) {

		return "junggoDetail";
	}

}
