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
import com.carrot.board.service.LikeyService;
import com.carrot.user.domain.UserDTO;
import com.carrot.user.service.UserService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	BoardService service;

	@Autowired
	UserService userService;

	@Autowired
	LikeyService likeyService;

	// 좋아요 취소
	@GetMapping("/dislike")
	public String downLikeCnt(Integer b_num, BoardDTO boardDto, LikeyDTO likeyDTO, HttpSession session) {
		String l_email = (String) session.getAttribute("m_email");

		likeyDTO.setL_menu("2");
		likeyDTO.setL_pbnum(b_num);
		likeyDTO.setL_email(l_email);

		try {
			if (likeyService.deleteLike(likeyDTO) != 1)
				throw new Exception("LikeDown_Likey failed");

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/board/read?menu=board&b_num=" + b_num;
	}

	// 좋아요
	@GetMapping("/like")
	public String upLikeCnt(Integer b_num, BoardDTO boardDto, LikeyDTO likeyDTO, HttpSession session) {
		String l_email = (String) session.getAttribute("m_email");

		likeyDTO.setL_menu("2");
		likeyDTO.setL_pbnum(b_num);
		likeyDTO.setL_email(l_email);

		try {

			if (likeyService.insertLike(likeyDTO) != 1)
				throw new Exception("LikeUp_Likey failed");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/board/read?menu=board&b_num=" + b_num;
	}

	// 게시물 삭제
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

	// 게시물 수정
	@PostMapping("/modify")
	public String modify(BoardDTO boardDTO, RedirectAttributes rattr, Model m, HttpSession session) {
		String b_email = (String) session.getAttribute("m_email");
		boardDTO.setB_email(b_email);
		try {
			if (service.modify(boardDTO) != 1)
				throw new Exception("Modify failed");

			rattr.addFlashAttribute("msg", "MOD_OK");

			return "redirect:/board/list";

		} catch (Exception e) {
			e.printStackTrace();

			// m.addAttribute("mode", "new");
			m.addAttribute("menu", "board");
			m.addAttribute("boardDto", boardDTO);
			m.addAttribute("msg", "MOD_ERR");

			return "boardDetail";
		}
	}

	// 수정 시 기존 게시물 읽어오기
	@GetMapping("/select")
	public String select(BoardDTO boardDTO, RedirectAttributes rattr, Model m, HttpSession session) {
		String b_email = (String) session.getAttribute("m_email");
		boardDTO.setB_email(b_email);

		try {
			boardDTO = service.select(boardDTO);

			m.addAttribute("boardDTO", boardDTO);
			m.addAttribute("menu", "board");

		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "LIST_ERR");
		}

		return "boardDetail";
	}

	// 게시물 임시 저장
	@GetMapping("/save")
	public String save(Model m) {
		m.addAttribute("mode", "new");
		m.addAttribute("menu", "board");
		return "boardDetail";
	}

	// 게시물 임시 저장
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

	// 게시물 작성
	@GetMapping("/write")
	public String write(Model m, HttpServletRequest request) {
		// 로그인 확인
		if (!loginCheck(request))
			return "redirect:/login/login?toURL=" + request.getRequestURL();

		m.addAttribute("mode", "new");
		m.addAttribute("menu", "board");
		return "boardDetail";
	}

	// 게시물 작성
	@PostMapping("/write")
	public String write(BoardDTO boardDTO, RedirectAttributes rattr, Model m, HttpSession session,
			HttpServletRequest request) {

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

	// 게시물 상세 읽기
	@GetMapping("/read")
	public String read(Integer b_num, Integer page, Integer pageSize, Model m, HttpSession session, UserDTO userDTO) {

		try {
			BoardDTO boardDTO = new BoardDTO();
			boardDTO.setB_num(b_num);
			String b_email = (String) session.getAttribute("m_email");
			boardDTO.setB_email(b_email);
			boardDTO = service.read(boardDTO);

			m.addAttribute("boardDTO", boardDTO);
			m.addAttribute("menu", "board");
			m.addAttribute("page", page);
			m.addAttribute("pageSize", pageSize);

			userDTO = userService.mypageInfo((String) session.getAttribute("m_email"));
			m.addAttribute("userDTO", userDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "junggoDetail";
	}

	// 게시글 리스트
	@GetMapping("/list")
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

	// 로그인 유무로 권한 확인
	@GetMapping("/chkLogin")
	public String chkLogin(Model m, HttpServletRequest request) {

		if (!loginCheck(request))
			return "redirect:/login/login?toURL=" + request.getRequestURL();
		return "redirect:/login/login?toURL=" + request.getRequestURL();
	}

	private boolean loginCheck(HttpServletRequest request) {
		HttpSession session = request.getSession();
		return session.getAttribute("m_email") != null;
	}

}
