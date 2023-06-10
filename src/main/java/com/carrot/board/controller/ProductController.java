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
import com.carrot.board.domain.PageHandlerP;
import com.carrot.board.domain.ProductDTO;
import com.carrot.board.domain.SearchConditionP;
import com.carrot.board.service.LikeyService;
import com.carrot.board.service.ProductService;

@Controller
@RequestMapping("/carrot")
public class ProductController {

	@Autowired
	ProductService service;

	@Autowired
	LikeyService likeyService;

	@GetMapping("/dislike")
	public String downLikeCnt(Integer b_num, LikeyDTO likeyDTO, HttpSession session) {
		String l_email = (String) session.getAttribute("m_email");

		likeyDTO.setL_menu("2");
		likeyDTO.setL_pbnum(b_num);
		likeyDTO.setL_email(l_email);

		System.out.println("downLikeCnt b_num" + b_num);
		System.out.println("downLikeCnt likeyDTO" + likeyDTO);

		try {
			int cnt = service.getCount();
			System.out.println(cnt);

			if (cnt != 0) {
				if (likeyService.deleteLike(likeyDTO) != 1)
					throw new Exception("LikeDown_Likey failed");
				if (service.decreaseLikeCnt(b_num) != 1)
					throw new Exception("LikeDown_Board failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "junggoDetail";
	}

	@GetMapping("/like")
	public String upLikeCnt(Integer b_num, LikeyDTO likeyDTO, HttpSession session) {
		String l_email = (String) session.getAttribute("m_email");

		likeyDTO.setL_menu("2");
		likeyDTO.setL_pbnum(b_num);
		likeyDTO.setL_email(l_email);

		try {
			int cnt = service.getCount();

			if (cnt == 0) {
				if (likeyService.insertLike(likeyDTO) != 1)
					throw new Exception("LikeUp_Likey failed");
				if (service.increaseLikeCnt(b_num) != 1)
					throw new Exception("LikeUp_Board failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "junggoDetail";
	}

	// 중고물품 게시글 목록 출력
	@GetMapping("/junggoMain")
	public String list(Model m, SearchConditionP scp) {
		try {
			int totalCnt = service.getCount();

			System.out.println("getCount:" + totalCnt);
			PageHandlerP pageHandlerP = new PageHandlerP(totalCnt, scp);
			System.out.println(pageHandlerP);

			List<ProductDTO> list = service.getSearchSelectPage(scp);
			System.out.println("list" + list);

			m.addAttribute("list", list);
			m.addAttribute("ph", pageHandlerP);

			Instant startOfToday = LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant();
			m.addAttribute("startOfToday", startOfToday.toEpochMilli());

		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "LIST_ERR");
			m.addAttribute("totalCnt", 0);
		}

		return "junggoMain";
	}

	// 중고물풀 게시글 읽기
	@GetMapping("/read")
	public String read(Integer p_num, Model m, Integer page, Integer pageSize, HttpSession session) {
		String login_email = (String) session.getAttribute("m_email");
		try {
			ProductDTO productDTO = service.read(p_num);
			// BoardDTO boardDTO = new BoardDTO(0 , "nocate", "noemail", "notitle",
			// "nocontent");

			System.out.println(productDTO);

			m.addAttribute(productDTO);
			m.addAttribute("menu", "product");
			m.addAttribute("page", page);
			m.addAttribute("pageSize", pageSize);

			Instant startOfToday = LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant();
			m.addAttribute("startOfToday", startOfToday.toEpochMilli());

			session.setAttribute("login_email", login_email);
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "READ_ERR");
		}

		return "junggoDetail";
	}

	@GetMapping("/write")
	public String write(Model m) {
		m.addAttribute("mode", "new");
		m.addAttribute("menu", "product");
		return "boardDetail";
	}

	@PostMapping("/write")
	public String write(ProductDTO productDTO, RedirectAttributes rattr, Model m, HttpSession session,
			HttpServletRequest request) {
		// 로그인 확인
		if (!loginCheck(request))
			return "redirect:/login/login?toURL=" + request.getRequestURL();

		String p_email = (String) session.getAttribute("m_email");
		productDTO.setP_email(p_email);
		if (request.getParameter("p_negoyn") == null) {
			productDTO.setP_negoyn("N");
		}

		try {
			if (service.write(productDTO) != 1)
				throw new Exception("Write failed");

			rattr.addFlashAttribute("msg", "WRT_OK");
			return "redirect:/carrot/junggoMain";

		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("mode", "new");
			m.addAttribute("menu", "product");
			m.addAttribute("productDTO", productDTO);
			m.addAttribute("msg", "WRT_ERR");
		}
		return "boardDetail";
	}

	@PostMapping("/remove")
	public String remove(Integer p_num, Integer page, Integer pageSize, RedirectAttributes rattr, Model m,
			HttpSession session) {
		String p_email = (String) session.getAttribute("m_email");

		System.out.println(p_email);
		try {
			m.addAttribute("page", page);
			m.addAttribute("pageSize", pageSize);

			System.out.println(p_num + ", " + p_email);

			int rowCnt = service.remove(p_num, p_email);

			System.out.println(rowCnt);

			if (rowCnt != 1) {
				throw new Exception("remove error");
			}

			rattr.addFlashAttribute("msg", "DEL_OK");

		} catch (Exception e) {
			e.printStackTrace();
			rattr.addFlashAttribute("msg", "DEL_ERR");
		}

		return "redirect:/carrot/junggoMain";
	}

	// 수정 시 게시글 가져오기
	@GetMapping("/select")
	public String select(ProductDTO productDTO, RedirectAttributes rattr, Model m, HttpSession session) {
		String p_email = (String) session.getAttribute("m_email");
		productDTO.setP_email(p_email);

		try {
			System.out.println("select -> productDTO : " + productDTO);
			productDTO = service.select(productDTO.getP_num());

			System.out.println(productDTO);
			m.addAttribute("productDTO", productDTO);
			m.addAttribute("menu", "product");

		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "LIST_ERR");
		}

		return "boardDetail";
	}

	@PostMapping("/modify")
	public String modify(ProductDTO productDTO, RedirectAttributes rattr, Model m, HttpSession session,
			HttpServletRequest request) {
		String p_email = (String) session.getAttribute("m_email");

		System.out.println(p_email);

		productDTO.setP_email(p_email);

		if (request.getParameter("p_negoyn") == null) {
			productDTO.setP_negoyn("N");
		}

		try {
			if (service.modify(productDTO) != 1) {
				System.out.println(productDTO);
				throw new Exception("Modify failed");
			}

			rattr.addFlashAttribute("msg", "MOD_OK");

			return "redirect:/carrot/junggoMain";

		} catch (Exception e) {
			e.printStackTrace();

			// m.addAttribute("mode", "new");
			m.addAttribute("menu", "product");
			m.addAttribute("productDTO", productDTO);
			m.addAttribute("msg", "MOD_ERR");

			return "junggoDetail";
		}
	}

	// 임시저장??
	@GetMapping("/save")
	public String save(Model m) {
		m.addAttribute("mode", "new");
		m.addAttribute("menu", "product");
		return "boardDetail";
	}

	@PostMapping("/save")
	public String save(ProductDTO productDTO, RedirectAttributes rattr, Model m, HttpSession session,
			HttpServletRequest request) {
		String p_email = (String) session.getAttribute("m_email");
		productDTO.setP_email(p_email);
		productDTO.setP_tempsaveyn("Y");

		if (request.getParameter("p_negoyn") == null) {
			productDTO.setP_negoyn("N");
		}

		try {
			if (service.save(productDTO) != 1)
				throw new Exception("Write failed");

			rattr.addFlashAttribute("msg", "WRT_OK");
			return "redirect:/carrot/junggoMain";

		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("mode", "new");
			m.addAttribute("menu", "product");
			m.addAttribute("productDTO", productDTO);
			m.addAttribute("msg", "WRT_ERR");
		}
		return "boardDetail";
	}

	// 로그인 확인
	@GetMapping("/chkLogin")
	public String chkLogin(Model m, HttpServletRequest request) {

		System.out.println("앎ㄴㅇㄻㄴㅇㄹ");
		if (!loginCheck(request))
			return "redirect:/login/login?toURL=" + request.getRequestURL();
		return "redirect:/login/login?toURL=" + request.getRequestURL();
	}

	private boolean loginCheck(HttpServletRequest request) {
		HttpSession session = request.getSession();
		return session.getAttribute("m_email") != null;
	}
}
