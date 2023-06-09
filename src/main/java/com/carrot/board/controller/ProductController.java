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

import com.carrot.board.domain.LikeyDTO;
import com.carrot.board.domain.PageHandlerP;
import com.carrot.board.domain.ProductDTO;
import com.carrot.board.domain.SearchConditionP;
import com.carrot.board.service.LikeyService;
import com.carrot.board.service.ProductService;
import com.carrot.user.domain.UserDTO;
import com.carrot.user.service.UserService;

@Controller
@RequestMapping("/carrot")
public class ProductController {

	@Autowired
	UserService userService;
	
	@Autowired
	ProductService service;

	@Autowired
	LikeyService likeyService;

	//좋아요 취소
	@GetMapping("/dislike")
	public String downLikeCnt(Integer p_num, LikeyDTO likeyDTO, HttpSession session) {
		String l_email = (String) session.getAttribute("m_email");

		likeyDTO.setL_menu("1");
		likeyDTO.setL_pbnum(p_num);
		likeyDTO.setL_email(l_email);

		try {
			if (likeyService.deleteLike(likeyDTO) != 1)
				throw new Exception("LikeDown_Likey failed");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/carrot/read?menu=product&p_num=" + p_num;
	}

	//좋아요
	@GetMapping("/like")
	public String upLikeCnt(Integer p_num, LikeyDTO likeyDTO, HttpSession session) {
		String l_email = (String) session.getAttribute("m_email");

		likeyDTO.setL_menu("1");
		likeyDTO.setL_pbnum(p_num);
		likeyDTO.setL_email(l_email);


		try {
			if (likeyService.insertLike(likeyDTO) != 1)
				throw new Exception("LikeUp_Likey failed");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/carrot/read?menu=product&p_num=" + p_num;
	}
	
	// 중고물품 게시글 목록 출력
	@GetMapping("/junggoMain")
	public String list(Model m, SearchConditionP scp) {
		try {
			int totalCnt = service.getCount();

			PageHandlerP pageHandlerP = new PageHandlerP(totalCnt, scp);
			
			List<ProductDTO> list = service.getSearchSelectPage(scp);
			
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
	public String read(Integer p_num, Model m, Integer page, Integer pageSize, HttpSession session, UserDTO userDTO) {
		String login_email = (String) session.getAttribute("m_email");
		
		try {
			ProductDTO productDTO = new ProductDTO();
			productDTO.setP_num(p_num);
			productDTO.setP_email(login_email);
			productDTO = service.read(productDTO);

			m.addAttribute(productDTO);
			m.addAttribute("menu", "product");
			m.addAttribute("page", page);
			m.addAttribute("pageSize", pageSize);
			
			userDTO = userService.mypageInfo((String)session.getAttribute("m_email"));
			m.addAttribute("userDTO", userDTO);
			
			Instant startOfToday = LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant();
			m.addAttribute("startOfToday", startOfToday.toEpochMilli());

			session.setAttribute("login_email", login_email);
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "READ_ERR");
		}

		return "junggoDetail";
	}

	//탭에서 + 버튼을 눌렸을 때, 글쓰기 페이지가 나오게 하는 메서드
	@GetMapping("/write")
	public String write(Model m, HttpServletRequest request) {
		
				
		m.addAttribute("mode", "new");
		m.addAttribute("menu", "product");
		
		// 로그인 확인
		if (!loginCheck(request))
			return "redirect:/login/login?toURL=" + request.getRequestURL();
		
		return "boardDetail";
	}
	
	//글쓰기 페이지에서 완료버튼을 눌렸을 때, 글쓰기가 가능하게 하는 메서드
	@PostMapping("/write")
	public String write(ProductDTO productDTO, RedirectAttributes rattr, Model m, HttpSession session,
			HttpServletRequest request) {
		
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

	//게시글 삭제
	@PostMapping("/remove")
	public String remove(Integer p_num, Integer page, Integer pageSize, RedirectAttributes rattr, Model m,
			HttpSession session) {
		String p_email = (String) session.getAttribute("m_email");

		try {
			m.addAttribute("page", page);
			m.addAttribute("pageSize", pageSize);

			int rowCnt = service.remove(p_num, p_email);


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
			
			productDTO = service.select(productDTO);

			m.addAttribute("productDTO", productDTO);
			m.addAttribute("menu", "product");

		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "LIST_ERR");
		}

		return "boardDetail";
	}

	//게시글 수정하기
	@PostMapping("/modify")
	public String modify(ProductDTO productDTO, RedirectAttributes rattr, Model m, HttpSession session,
			HttpServletRequest request) {
		String p_email = (String) session.getAttribute("m_email");

		productDTO.setP_email(p_email);

		if (request.getParameter("p_negoyn") == null) {
			productDTO.setP_negoyn("N");
		}

		try {
			if (service.modify(productDTO) != 1) {
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

	// 임시저장
	@GetMapping("/save")
	public String save(Model m) {
		m.addAttribute("mode", "new");
		m.addAttribute("menu", "product");
		return "boardDetail";
	}

	//임시저장하기
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
	private boolean loginCheck(HttpServletRequest request) {
		HttpSession session = request.getSession();
		return session.getAttribute("m_email") != null;
	}
}
