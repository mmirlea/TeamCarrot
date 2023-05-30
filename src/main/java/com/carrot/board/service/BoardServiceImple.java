package com.carrot.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.carrot.board.dao.BoardDAO;
import com.carrot.board.domain.BoardDTO;

public class BoardServiceImple implements BoardService {

	@Autowired
	BoardDAO boardDAO;

	@Override
	public int getCount() throws Exception {
		return boardDAO.count();
	}

	@Override
	public int write(BoardDTO boardDTO) throws Exception {
		return boardDAO.insert(boardDTO);
	}

	@Override
	public int modify(BoardDTO boardDTO) throws Exception {
		return boardDAO.update(boardDTO);
	}

	@Override
	public int remove(Integer bno, String writer) throws Exception {
		return boardDAO.delete(bno, writer);
	}

	@Override
	public int removeAll() throws Exception {
		return boardDAO.deleteAll();
	}

	@Override
	public List<BoardDTO> getAll() throws Exception {
		return boardDAO.selectAll();
	}

	// 읽을 때 조회되도록 한번에 묶어서 사용
	@Override
	public BoardDTO read(int bno) throws Exception {
		BoardDTO boardDTO = boardDAO.select(bno);
		boardDAO.increaseViewCnt(bno);
		return boardDTO;
	}

	// 페이징 처리
	/*
	 * public List<BoardDTO> getPage(Map map) throws Exception { return
	 * boardDAO.selectPage(map); }
	 * 
	 * public List<BoardDTO> getSearchSelectPage(SearchCondition sc) throws
	 * Exception { return boardDAO.searchSelectPage(sc); }
	 * 
	 * public int getSearchResultCnt(SearchCondition sc) throws Exception { return
	 * boardDAO.searchResultCnt(sc); }
	 */

}
