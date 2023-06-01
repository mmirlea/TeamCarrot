package com.carrot.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.carrot.board.domain.SearchCondition;
import com.carrot.board.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	BoardService service;

	@GetMapping("/save")
	public String save(Model m) {
		m.addAttribute("mode", "new");
		m.addAttribute("menu", "board");
		return "boardDetail";
	}

	@PostMapping("/save")
	public String save(BoardDTO boardDTO, RedirectAttributes rattr, Model m, HttpSession session) {
		String b_email = (String) session.getAttribute("email");
		boardDTO.setB_email(b_email);

		try {
			if (service.write(boardDTO) != 1)
				throw new Exception("Write failed");

			rattr.addFlashAttribute("msg", "WRT_OK");
			return "redirect:/board/list";

		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("mode", "new");
			m.addAttribute("menu", "board");
			m.addAttribute("boardDTO", boardDTO);
			m.addAttribute("msg", "WRT_ERR");
		}
		return "boardDetail";
	}

	@GetMapping("/write")
	public String write(Model m) {
		m.addAttribute("mode", "new");
		m.addAttribute("menu", "board");
		return "boardDetail";
	}

	@PostMapping("/write")
	public String write(BoardDTO boardDTO, RedirectAttributes rattr, Model m, HttpSession session,
			HttpServletRequest request) {
		// 로그인 확인
		if (!loginCheck(request))
			return "redirect:/login/login?toURL=" + request.getRequestURL();

		String b_email = (String) session.getAttribute("email");
		boardDTO.setB_email(b_email);

		try {
			if (service.write(boardDTO) != 1)
				throw new Exception("Write failed");

			rattr.addFlashAttribute("msg", "WRT_OK");
			return "redirect:/board/list";

		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("mode", "new");
			m.addAttribute("menu", "board");
			m.addAttribute("boardDTO", boardDTO);
			m.addAttribute("msg", "WRT_ERR");
		}
		return "boardDetail";
	}

	@GetMapping("/read")
	public String read(Integer b_num, Integer page, Integer pageSize, Model m) {

		System.out.println("b_num : " + b_num);
		System.out.println("page : " + page);
		System.out.println("pageSize : " + pageSize);

		try {
			BoardDTO boardDTO = service.read(b_num);
			m.addAttribute("boardDTO", boardDTO);
			m.addAttribute("menu", "board");
			m.addAttribute("page", page);
			m.addAttribute("pageSize", pageSize);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "junggoDetail";
	}

	@GetMapping("/list")
//	public String list(Integer page, Integer pageSize, Model m, HttpServletRequest request) {
	public String list(SearchCondition sc, Model m) {
		try {
			int totalCnt = service.getCount();
			PageHandler pageHandler = new PageHandler(totalCnt, sc);

			List<BoardDTO> list = service.getSearchSelectPage(sc);

			m.addAttribute("list", list);
			m.addAttribute("ph", pageHandler);

			Instant startOfToday = LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant();
			m.addAttribute("startOfToday", startOfToday.toEpochMilli());

		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "LIST_ERR");
			m.addAttribute("totalCnt", 0);
		}

		return "boardMain";
	}

	private boolean loginCheck(HttpServletRequest request) {
		HttpSession session = request.getSession();
		return session.getAttribute("email") != null;
	}

}
