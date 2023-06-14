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

import com.carrot.board.domain.CommentsbDTO;
import com.carrot.board.service.CommentsbService;
import com.carrot.user.domain.UserDTO;

@RestController
public class CommentsbController {

	@Autowired
	CommentsbService service;
	
	//댓글 수정
	@PatchMapping("/commentsb/{cb_num}")
	public ResponseEntity<String> modify(@PathVariable Integer cb_num, @RequestBody CommentsbDTO commentsbDTO, HttpSession session, HttpServletRequest request){
		session = request.getSession();
		String cb_email = (String)session.getAttribute("m_email");
		//String cb_nicknm = (String)session.getAttribute("m_nicknm");
		
		commentsbDTO.setCb_num(cb_num);
		commentsbDTO.setCb_email(cb_email);
		//commentsbDTO.setCb_nicknm(cb_nicknm);
		
		System.out.println("dto : " + commentsbDTO);
		
		try {
			if(service.modify(commentsbDTO) != 1) {
				throw new Exception("comment modify Failed");
			}
			return new ResponseEntity<String>("MOD_OK",HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>("MOD_ERR", HttpStatus.BAD_GATEWAY);
		}
	}
	
	//댓글 등록
	@PostMapping("/commentsb")
	public ResponseEntity<String> write(@RequestBody CommentsbDTO commentsbDTO, @RequestParam Integer cb_pnum, @RequestParam String cb_nicknm, @RequestParam(required = false) Integer cb_pcnum, HttpSession session, HttpServletRequest request, UserDTO userDTO){
		session = request.getSession();
		String cb_email = (String)session.getAttribute("m_email");
		
		commentsbDTO.setCb_email(cb_email);
		commentsbDTO.setCb_pnum(cb_pnum);
		commentsbDTO.setCb_nicknm(cb_nicknm);
		
//		if (cb_pcnum != null) {
//            commentsbDTO.setCb_pcnum(cb_pcnum);
//        } else {
//            commentsbDTO.setCb_pcnum(0);
//        }
		
		System.out.println("dto : " + commentsbDTO);
		
		try {
			if(service.write(commentsbDTO) != 1)
				throw new Exception("comment write Failed");
			return new ResponseEntity<String>("WRT_OK", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>("WRT_ERR", HttpStatus.BAD_REQUEST);
		}
	}
	
	//댓글 삭제
	@DeleteMapping("/commentsb/{cb_num}")
	public ResponseEntity<String> remove(@PathVariable Integer cb_num, Integer cb_pnum, HttpSession session, HttpServletRequest request){
		session = request.getSession();
		String cb_email = (String)session.getAttribute("m_email");
		
		try {
			int rowCnt = service.removep(cb_num, cb_email, cb_pnum);
			
			if(rowCnt != 1)
				throw new Exception("Comments Delete Failed");
			return new ResponseEntity<String>("DEL_OK", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>("DEL_ERR", HttpStatus.BAD_REQUEST);
		}
	}
	
	//댓글 목록 반환
	@GetMapping("/commentsb")
	public ResponseEntity<List<CommentsbDTO>> list(Integer cb_pnum){
		List<CommentsbDTO> list = null;
		try {
			list = service.getList(cb_pnum);
			return new ResponseEntity<List<CommentsbDTO>>(list, HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<List<CommentsbDTO>>(list, HttpStatus.BAD_REQUEST);
		}
	}
}
