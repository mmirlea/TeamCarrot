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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.carrot.board.domain.CommentspDTO;
import com.carrot.board.service.CommentspService;

@RestController
public class CommentspController {

	@Autowired
	CommentspService service;
	
	//댓글 수정
	@PatchMapping("/commentsp/{cp_num}")
	public ResponseEntity<String> modify(@PathVariable Integer cp_num, @RequestBody CommentspDTO commentspDTO, HttpSession session, HttpServletRequest request){
		session = request.getSession();
		String cp_email = (String)session.getAttribute("m_email");
		//String cp_nicknm = (String)session.getAttribute("m_nicknm");
		
		commentspDTO.setCp_num(cp_num);
		commentspDTO.setCp_email(cp_email);
		//commentspDTO.setCp_nicknm(cp_nicknm);
		
		System.out.println("dto : " + commentspDTO);
		
		try {
			if(service.modify(commentspDTO) != 1) {
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
	public ResponseEntity<String> write(@RequestBody CommentspDTO commentspDTO, @RequestParam Integer cp_pnum, @RequestParam(required = false) Integer cp_pcnum, HttpSession session, HttpServletRequest request){
		session = request.getSession();
		String cp_email = (String)session.getAttribute("m_email");
		
		commentspDTO.setCp_email(cp_email);
		commentspDTO.setCp_pnum(cp_pnum);
		
		if (cp_pcnum != null) {
            commentspDTO.setCp_pcnum(cp_pcnum);
        } else {
            commentspDTO.setCp_pcnum(commentspDTO.getCp_num());
        }
		
		System.out.println("dto : " + commentspDTO);
		
		try {
			if(service.write(commentspDTO) != 1)
				throw new Exception("comment write Failed");
			return new ResponseEntity<String>("WRT_OK", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>("WRT_ERR", HttpStatus.BAD_REQUEST);
		}
	}
	
	//댓글 삭제
	@DeleteMapping("/commentsp/{cp_num}")
	public ResponseEntity<String> remove(@PathVariable Integer cp_num, Integer cp_pnum, HttpSession session, HttpServletRequest request){
		session = request.getSession();
		String cp_email = (String)session.getAttribute("m_email");
		
		try {
			int rowCnt = service.removep(cp_num, cp_email, cp_pnum);
			
			if(rowCnt != 1)
				throw new Exception("Comments Delete Failed");
			return new ResponseEntity<String>("DEL_OK", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>("DEL_ERR", HttpStatus.BAD_REQUEST);
		}
	}
	
	//댓글 목록 반환
	@GetMapping("/commentsp")
	public ResponseEntity<List<CommentspDTO>> list(Integer cp_pnum){
		List<CommentspDTO> list = null;
		try {
			list = service.getList(cp_pnum);
			return new ResponseEntity<List<CommentspDTO>>(list, HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<List<CommentspDTO>>(list, HttpStatus.BAD_REQUEST);
		}
	}
}
