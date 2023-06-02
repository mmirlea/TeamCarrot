package com.carrot.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carrot.board.dao.BoardDAO;
import com.carrot.board.domain.BoardDTO;
import com.carrot.board.domain.SearchCondition;

@Service
public class BoardServiceImple implements BoardService {

	@Autowired
	BoardDAO boardDAO;

	@Override
	public BoardDTO select(Integer b_num) throws Exception {
		return boardDAO.select(b_num);
	}

	public int getCount() throws Exception {
		return boardDAO.count();
	}

	@Override
	public int write(BoardDTO boardDTO) throws Exception {
		return boardDAO.insert(boardDTO);
	}

	@Override
	public int save(BoardDTO boardDTO) throws Exception {
		return boardDAO.save(boardDTO);
	}

	@Override
	public int modify(BoardDTO boardDTO) throws Exception {
		return boardDAO.update(boardDTO);
	}

	@Override
	public int remove(Integer b_num, String b_email) throws Exception {
		return boardDAO.delete(b_num, b_email);
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
	public BoardDTO read(int b_num) throws Exception {
		BoardDTO boardDTO = boardDAO.select(b_num);
		boardDAO.increaseViewCnt(b_num);
		return boardDTO;
	}

	// 페이징 처리
	@Override
	public List<BoardDTO> getPage(Map map) throws Exception {
		return boardDAO.selectPage(map);
	}

	@Override
	public List<BoardDTO> getSearchSelectPage(SearchCondition sc) throws Exception {
		return boardDAO.searchSelectPage(sc);
	}

	@Override
	public int getSearchResultCnt(SearchCondition sc) throws Exception {
		return boardDAO.searchResultCnt(sc);
	}

}
