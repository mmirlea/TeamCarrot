package com.carrot.board.controller;

import java.util.List;

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

import com.carrot.board.domain.CommentsDTO;
import com.carrot.board.service.CommentsService;

@RestController
public class CommentsController {

	@Autowired
	CommentsService service;
	
	//댓글 수정 메서드
	@PatchMapping("/comments/{c_num}")
	public ResponseEntity<String> modify(@PathVariable Integer c_num, @RequestBody CommentsDTO dto, HttpSession session){
		String c_email = (String)session.getAttribute("m_email");
		
		dto.setC_num(c_num);
		dto.setC_email(c_email);
		
		System.out.println("dto : " + dto);
		
		try {
			if(service.modify(dto) != 1)
				throw new Exception("comment modify Failed");
			return new ResponseEntity<String>("MOD_OK", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("MOD_ERR", HttpStatus.BAD_REQUEST);
		}
	}
	
	//댓글 등록하는 메서드
	@PostMapping("/comments")
	public ResponseEntity<String> write(@RequestBody CommentsDTO dto, Integer c_pnum, HttpSession session){
		String c_email = (String) session.getAttribute("m_email");
		
		dto.setC_email(c_email);
		dto.setC_pnum(c_pnum);
		
		System.out.println("dto : " + dto);
		
		try {
			if(service.write(dto) != 1)
				throw new Exception("comment write Failed");
			return new ResponseEntity<String>("WRT_OK", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>("WRT_ERR", HttpStatus.BAD_REQUEST);
		}
	}
	
	//댓글 삭제
	@DeleteMapping("/comments/{c_num}")
	public ResponseEntity<String> remove (@PathVariable Integer c_num, Integer c_pnum, HttpSession session){
		String c_email = (String) session.getAttribute("m_email");
		
		try {
			int rowCnt = service.remove(c_num, c_email, c_pnum);
			if(rowCnt != 1)
				throw new Exception("Comments Delete Failed");
			return new ResponseEntity<String>("DEL_OK", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>("DEL_ERR", HttpStatus.BAD_REQUEST);
		}
	}
	
	@GetMapping("/comments")
	public ResponseEntity<List<CommentsDTO>> list(Integer c_pnum){
		List<CommentsDTO> list = null;
		try {
			list = service.getList(c_pnum);
			return new ResponseEntity<List<CommentsDTO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<List<CommentsDTO>>(HttpStatus.BAD_REQUEST);
		}
	}
}
