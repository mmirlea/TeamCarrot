package com.carrot.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.carrot.board.dao.CommentspDAO;
import com.carrot.board.dao.ProductDAO;
import com.carrot.board.domain.CommentspDTO;

@Service
public class CommentspServiceImpl implements CommentspService {
	
	CommentspDAO commentspDAO;
	ProductDAO productDAO;
	
	@Autowired
	public CommentspServiceImpl(CommentspDAO commentspDAO, ProductDAO productDAO) {
		this.commentspDAO = commentspDAO;
		this.productDAO = productDAO;
	}
	
	//댓글 개수
	@Override
	public int getCount(Integer cp_pnum) throws Exception{
		return commentspDAO.count(cp_pnum);
	}
	
	//게시글의 모든 댓글
	@Override
	public List<CommentspDTO> getList(Integer cp_pnum) throws Exception{
		return commentspDAO.selectAll(cp_pnum);
	}
	
	//댓글 내용 가져오기
	@Override
	public CommentspDTO read(Integer cp_num) throws Exception{
		return commentspDAO.select(cp_num);
	}
	
	//댓글 수정
	@Override
	public int modify(CommentspDTO commentspDTO) throws Exception{
		return commentspDAO.update(commentspDTO);
	}
	
	//댓글 작성 (댓글 수 증가)
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int write(CommentspDTO commentspDTO) throws Exception{
		productDAO.updateCommentspCnt(commentspDTO.getCp_pnum(), 1);
		return commentspDAO.insert(commentspDTO);
	}
	
	//댓글 지우기 (댓글 수 감소)
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int removep(Integer cp_num, String cp_email, Integer cp_pnum) throws Exception{
		int rowCnt = productDAO.updateCommentspCnt(cp_pnum, -1);
		System.out.println("updateCommentspCnt - rowCnt = " + rowCnt);
		rowCnt = commentspDAO.delete(cp_num, cp_email);
		System.out.println("rowCnt = " + rowCnt);
		return rowCnt;
	}
}
