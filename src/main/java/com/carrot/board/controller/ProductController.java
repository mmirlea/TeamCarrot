package com.carrot.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.carrot.board.domain.PageHandler;
import com.carrot.board.domain.PageHandlerP;
import com.carrot.board.domain.ProductDTO;
import com.carrot.board.domain.SearchConditionP;
import com.carrot.board.service.ProductService;

@Controller
@RequestMapping("/carrot")
public class ProductController {

	@Autowired
	ProductService service;
	
	//중고물품 게시글 목록 출력
	@GetMapping("/junggoMain")
	public String list(Model m, SearchConditionP scp) {
		try {
			int totalCnt = service.getCount();
			
			PageHandlerP pageHandlerP = new PageHandlerP(totalCnt, scp);
			
			List<ProductDTO> list = service.getSearchSelectPage(scp);
			
			m.addAttribute("list", list);
			m.addAttribute("ph", pageHandlerP);
			
		}catch(Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "LIST_ERR");
			m.addAttribute("totalCnt", 0);
		}
		
		return "junggoMain";
	}
	
	//중고물풀 게시글 읽기
	@GetMapping("/read")
	public String read(Integer p_num, Model m) {
		try {
			ProductDTO productDTO = service.read(p_num);
			
			m.addAttribute(productDTO);
		}catch(Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "READ_ERR");
		}
		
		return "junggoDetail";
	}
	
	@GetMapping("/write")
	public String write(Model m) {
		
		m.addAttribute("mode", "new_product");
		
		return "JunggoDetail";
	}
	
}
