package com.carrot.board.controller;

import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.carrot.board.domain.BoardDTO;
import com.carrot.board.domain.PageHandler;
import com.carrot.board.domain.SearchCondition;
import com.carrot.board.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

@Autowired
BoardService service;

	@GetMapping("/list")
//	public String list(Integer page, Integer pageSize, Model m, HttpServletRequest request) {
	public String list(SearchCondition sc, Model m, HttpServletRequest request) {
		// 로그인 확인
//		if (!loginCheck(request))
//			return "redirect:/login/login?toURL=" + request.getRequestURL();

//		try {
//			int totalCnt = service.getCount();
//			PageHandler pageHandler = new PageHandler(totalCnt, sc);
//
//			List<BoardDTO> list = service.getSearchSelectPage(sc);
//
//			m.addAttribute("list", list);
//			m.addAttribute("ph", pageHandler);
//
//			Instant startOfToday = LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant();
//			m.addAttribute("startOfToday", startOfToday.toEpochMilli());
//
//		} catch (Exception e) {
//			e.printStackTrace();
//			m.addAttribute("msg", "LIST_ERR");
//			m.addAttribute("totalCnt", 0);
//		}
//		
//		try {
//			int totalCnt = service.getCount();
//			
//			PageHandler pageHandler = new PageHandler(totalCnt, page, pageSize);
//			
//			Map map = new HashMap();
//			map.put("page", page);
//			map.put("pageSize", pageSize);
//			
//			List<BoardDTO> list = service.getPage(map);
//			
//			m.addAttribute("list", list);
//			m.addAttribute("ph", pageHandler);
//			m.addAttribute("page", page);
//			m.addAttribute("pageSize", pageSize);
//			
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}

		return "boardMain";
	}

	private boolean loginCheck(HttpServletRequest request) {
		HttpSession session = request.getSession();
		return session.getAttribute("id") != null;
	}

	@GetMapping("/write")
	public String write(Model m) {

		return "boardDetail";
	}

	@GetMapping("/read")
	public String read(Model m) {

		return "junggoDetail";
	}

}
