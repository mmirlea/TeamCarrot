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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.carrot.board.domain.BoardDTO;
import com.carrot.board.domain.LikeyDTO;
import com.carrot.board.domain.PageHandler;
import com.carrot.board.domain.SearchCondition;
import com.carrot.board.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	BoardService service;
	
	@GetMapping("/like")
	public int upLikeCnt(Integer b_num, BoardDTO boardDTO, LikeyDTO likeyDTO, HttpSession session) {
		String b_email = (String) session.getAttribute("m_email");
		System.out.println("넘어와");
		int likeCnt = 0;
		try {
			likeCnt = service.UpLike(b_num, boardDTO, likeyDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return likeCnt;
	}
	
	@PostMapping("/remove")
	public String remove(Integer b_num, Integer page, Integer pageSize, RedirectAttributes rattr, Model m,
			HttpSession session) {
		String b_email = (String) session.getAttribute("m_email");

		try {
			m.addAttribute("page", page);
			m.addAttribute("pageSize", pageSize);

			int rowCnt = service.remove(b_num, b_email);

			if (rowCnt != 1) {
				throw new Exception("remove error");
			}

			rattr.addFlashAttribute("msg", "DEL_OK");

		} catch (Exception e) {
			e.printStackTrace();
			rattr.addFlashAttribute("msg", "DEL_ERR");
		}

		return "redirect:/board/list";
	}

	@PostMapping("/modify")
	public String modify(BoardDTO boardDTO, RedirectAttributes rattr, Model m, HttpSession session) {
		String b_email = (String) session.getAttribute("m_email");
		boardDTO.setB_email(b_email);
		System.out.println("modify b_email " + b_email);
		System.out.println("modify boardDTO " + boardDTO);
		try {
			if (service.modify(boardDTO) != 1)
				throw new Exception("Modify failed");

			rattr.addFlashAttribute("msg", "MOD_OK");

			return "redirect:/board/list";

		} catch (Exception e) {
			e.printStackTrace();

			//m.addAttribute("mode", "new"); 
			m.addAttribute("menu", "board");
			m.addAttribute("boardDto", boardDTO); 
			m.addAttribute("msg", "MOD_ERR"); 

			return "boardDetail"; 
		}
	}
	
	@GetMapping("/select")
	public String select(BoardDTO boardDTO, RedirectAttributes rattr, Model m, HttpSession session) {
		String b_email = (String) session.getAttribute("m_email");
		boardDTO.setB_email(b_email);
		
		try {
			System.out.println("select -> boardDTO : " + boardDTO);
			boardDTO = service.select(boardDTO.getB_num());

			m.addAttribute("boardDTO", boardDTO);
			m.addAttribute("menu", "board");

		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "LIST_ERR");
		}

		return "boardDetail";
	}
	
	@GetMapping("/save")
	public String save(Model m) {
		m.addAttribute("mode", "new");
		m.addAttribute("menu", "board");
		return "boardDetail";
	}

	@PostMapping("/save")
	public String save(BoardDTO boardDTO, RedirectAttributes rattr, Model m, HttpSession session) {
		String b_email = (String) session.getAttribute("m_email");
		boardDTO.setB_email(b_email);
		boardDTO.setB_tempSaveYn("Y");
		
		try {
			if (service.save(boardDTO) != 1)
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

		String b_email = (String) session.getAttribute("m_email");
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
	public String list(SearchCondition sc, Model m) {
		try {
			int totalCnt = service.getCount();
			PageHandler pageHandler = new PageHandler(totalCnt, sc);

			List<BoardDTO> list = service.getSearchSelectPage(sc);
			System.out.println("list" + list);
			
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
	
	@GetMapping("/chkLogin")
	public String chkLogin(Model m, HttpServletRequest request) {
		
		System.out.println("request.getRequestURL() " + request.getRequestURL());
		if (!loginCheck(request))
			return "redirect:/login/login?toURL=" + request.getRequestURL();
		return "redirect:/login/login?toURL=" + request.getRequestURL();
	}

	private boolean loginCheck(HttpServletRequest request) {
		HttpSession session = request.getSession();
		return session.getAttribute("m_email") != null;
	}

}
