package com.carrot.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.carrot.board.domain.ProductDTO;
import com.carrot.board.service.ProductService;

@Controller
@RequestMapping("/carrot")
public class ProductController {

	@Autowired
	ProductService service;
	
	//중고물품 목록 출력
	@GetMapping("/junggoMain")
	public String list(Model m, HttpServletRequest request) {
		try {
			
			List<ProductDTO> list = service.selectAll();
			m.addAttribute("list", list);
			
		}catch(Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "LIST_ERR");
		}
		
		return "junggoMain";
	}
	
	
}
