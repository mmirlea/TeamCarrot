package com.carrot.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.carrot.board.dao.BoardDAO;
import com.carrot.board.dao.CommentsbDAO;
import com.carrot.board.domain.CommentsbDTO;

@Service
public class CommentsbServiceImpl implements CommentsbService {

	CommentsbDAO commentsbDAO;
	BoardDAO boardDAO;

	@Autowired
	public CommentsbServiceImpl(CommentsbDAO commentsbDAO, BoardDAO boardDAO) {
		this.commentsbDAO = commentsbDAO;
		this.boardDAO = boardDAO;
	}

	// 댓글 개수
	@Override
	public int getCount(Integer cb_pnum) throws Exception {
		return commentsbDAO.count(cb_pnum);
	}

	// 게시글의 모든 댓글
	@Override
	public List<CommentsbDTO> getList(Integer cb_pnum) throws Exception {
		return commentsbDAO.selectAll(cb_pnum);
	}

	// 댓글 내용 가져오기
	@Override
	public CommentsbDTO read(Integer cb_num) throws Exception {
		return commentsbDAO.select(cb_num);
	}

	// 댓글 수정
	@Override
	public int modify(CommentsbDTO commentsbDTO) throws Exception {
		return commentsbDAO.update(commentsbDTO);
	}

	// 댓글 작성 (댓글 수 증가)
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int write(CommentsbDTO commentsbDTO) throws Exception {
		boardDAO.updateCommentsbCnt(commentsbDTO.getCb_pnum(), 1);
		return commentsbDAO.insert(commentsbDTO);
	}

	// 댓글 지우기 (댓글 수 감소)
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int removep(Integer cb_num, String cb_email, Integer cb_pnum) throws Exception {
		int rowCnt = boardDAO.updateCommentsbCnt(cb_pnum, -1);
		System.out.println("updateCommentsbCnt - rowCnt = " + rowCnt);
		rowCnt = commentsbDAO.delete(cb_num, cb_email);
		System.out.println("rowCnt = " + rowCnt);
		return rowCnt;
	}
}
