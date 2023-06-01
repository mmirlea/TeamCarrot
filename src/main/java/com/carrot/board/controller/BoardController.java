package com.carrot.board.controller;

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
import com.carrot.board.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	BoardService service;

	@GetMapping("/write")
	public String write(Model m) {
		m.addAttribute("mode", "new");
		m.addAttribute("menu", "board");
		return "boardDetail";
	}
	
	@PostMapping("/write")
	public String write(BoardDTO boardDTO, RedirectAttributes rattr, Model m, HttpSession session) {
//		String b_emial = (String) session.getAttribute("email");
		String b_email = "green@naver.com";
		boardDTO.setB_email(b_email);
		
		String b_cate= "일상";
		boardDTO.setB_cate(b_cate);
		
		String b_title= "제메ㅔ에오모목";
		boardDTO.setB_title(b_title);
		
		String b_content= "내애ㅐㅐ요옹ㅇ";
		boardDTO.setB_content(b_content);

		System.out.println("write -> m : " + m);
		System.out.println("write -> boardDTO : " + boardDTO);
		try {
			if (service.write(boardDTO) != 1)
				throw new Exception("Write failed");

			rattr.addFlashAttribute("msg", "WRT_OK");

			return "redirect:/board/list"; // 주소를 이용하여 찾아감

		} catch (Exception e) {
			e.printStackTrace();

			m.addAttribute("mode", "new"); // 글쓰기 모드로 이동
			m.addAttribute("boardDTO", boardDTO); // 등록하려던 내용 전송
			m.addAttribute("msg", "WRT_ERR"); // 에러메세지

			return "boardDetail"; // 파일 위치를 찾아감
		}
	}
	
	@GetMapping("/read")
	public String read(Integer b_num, Integer page, Integer pageSize, Model m) {
		
		System.out.println("b_num : " + b_num);
		System.out.println("page : " + page);
		System.out.println("pageSize : " + pageSize);

//		try {
//			BoardDTO boardDTO = service.read(b_num);
//			m.addAttribute("boardDTO", boardDTO);
//			m.addAttribute("menu", "board");
//			m.addAttribute("page", page);
//			m.addAttribute("pageSize", pageSize);
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}

		return "junggoDetail";
	}

	@GetMapping("/list")
//	public String list(Integer page, Integer pageSize, Model m, HttpServletRequest request) {
	public String list(Model m, HttpServletRequest request) {
		try {

			List<BoardDTO> list = service.getAll();
			m.addAttribute("list", list);

		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "LIST_ERR");
		}

		return "boardMain";
	}

	private boolean loginCheck(HttpServletRequest request) {
		HttpSession session = request.getSession();
		return session.getAttribute("id") != null;
	}

}
