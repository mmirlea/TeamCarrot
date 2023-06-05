package com.carrot.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.carrot.board.dao.BoardDAO;
import com.carrot.board.dao.CommentsDAO;
import com.carrot.board.domain.CommentsDTO;

@Service
public class CommentsServiceImpl implements CommentsService {
	
	//@Autowired
	CommentsDAO commentsDAO;
	
	//@Autowired
	BoardDAO boardDAO;
	
	@Autowired
	public CommentsServiceImpl(CommentsDAO commentsDAO, BoardDAO boardDAO) {
		this.commentsDAO = commentsDAO;
		this.boardDAO = boardDAO;
	}
	
	//댓글 개수
	@Override
	public int getCount(Integer c_pnum) throws Exception{
		return commentsDAO.count(c_pnum);
	}
	
	//게시글의 모든 댓글
	@Override
	public List<CommentsDTO> getList(Integer c_pnum) throws Exception{
		return commentsDAO.selectAll(c_pnum);
	}
	
	//댓글 내용 가져오기
	@Override
	public CommentsDTO read(Integer c_num) throws Exception{
		return commentsDAO.select(c_num);
	}
	
	//댓글 수정
	@Override
	public int modify(CommentsDTO commentsDTO) throws Exception{
		return commentsDAO.update(commentsDTO);
	}
	
	//댓글 작성 (댓글 수 증가)
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int write(CommentsDTO commentsDTO) throws Exception{
		boardDAO.updateCommentsCnt(commentsDTO.getC_pnum(), 1);
		return commentsDAO.insert(commentsDTO);
	}
	
	//댓글 지우기 (댓글 수 감소)
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int remove(Integer c_num, String c_email, Integer c_pnum) throws Exception{
		int rowCnt = boardDAO.updateCommentsCnt(c_pnum, -1);
		System.out.println("updateCommentsCnt - rowCnt = " + rowCnt);
		rowCnt = commentsDAO.delete(c_num, c_email);
		System.out.println("rowCnt = "+rowCnt);
		return rowCnt;
	}
}
