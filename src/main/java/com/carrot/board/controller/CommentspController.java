package com.carrot.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.carrot.board.domain.CommentspDTO;
import com.carrot.board.service.CommentspService;

@RestController
public class CommentspController {

	@Autowired
	CommentspService service;
	
	//댓글 수정
	@PatchMapping("/commentsp/{c_num}")
	public ResponseEntity<String> modify(@PathVariable Integer cp_num, @RequestBody CommentspDTO dto, HttpSession session, HttpServletRequest request){
		session = request.getSession();
		String cp_email = (String)session.getAttribute("m_email");
		
		dto.setCp_num(cp_num);
		dto.setCp_email(cp_email);
		
		System.out.println("dto : " + dto);
		
		try {
			if(service.modify(dto) != 1) {
				throw new Exception("comment modify Failed");
			}
			return new ResponseEntity<String>("MOD_OK",HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>("MOD_ERR", HttpStatus.BAD_GATEWAY);
		}
	}
	
	//댓글 등록
	@PostMapping("/commentsp")
	public ResponseEntity<String> write(@RequestBody CommentspDTO dto, Integer p_num, HttpSession session, HttpServletRequest request){
		session = request.getSession();
		String cp_email = (String)session.getAttribute("m_email");
		
		dto.setCp_email(cp_email);
		dto.setCp_pnum(p_num);
	
		System.out.println("dto : " + dto);
		
		try {
			if(service.write(dto) != 1)
				throw new Exception("comment write Failed");
			return new ResponseEntity<String>("WRT_OK", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>("WRT_ERR", HttpStatus.BAD_REQUEST);
		}
	}
	
	//댓글 삭제
	@DeleteMapping("/commentsp/{cp_num}")
	public ResponseEntity<String> remove(@PathVariable Integer cp_num, Integer p_num, HttpSession session, HttpServletRequest request){
		session = request.getSession();
		String cp_email = (String)session.getAttribute("m_email");
		
		try {
			int rowCnt = service.remove(cp_num, cp_email, p_num);
			
			if(rowCnt != 1)
				throw new Exception("Comments Delete Failed");
			return new ResponseEntity<String>("DEL_OK", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>("DEL_ERR", HttpStatus.BAD_REQUEST);
		}
	}
	
	//댓글 목록 반환
	@GetMapping("/comments")
	public ResponseEntity<List<CommentspDTO>> list(Integer p_num){
		List<CommentspDTO> list = null;
		try {
			list = service.getList(p_num);
			return new ResponseEntity<List<CommentspDTO>>(list, HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<List<CommentspDTO>>(list, HttpStatus.BAD_REQUEST);
		}
	}
}
