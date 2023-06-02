package com.carrot.board.service;

import java.util.List;
import java.util.Map;

import com.carrot.board.domain.BoardDTO;
import com.carrot.board.domain.SearchCondition;

public interface BoardService {
	
	BoardDTO select(Integer b_num) throws Exception;

	int getCount() throws Exception;

	int write(BoardDTO boardDTO) throws Exception;
	
	int save(BoardDTO boardDTO) throws Exception;

	int modify(BoardDTO boardDTO) throws Exception;

	int remove(Integer b_num, String b_email) throws Exception;

	int removeAll() throws Exception;

	List<BoardDTO> getAll() throws Exception;

	// 읽을 때 조회되도록 한번에 묶어서 사용
	BoardDTO read(int b_num) throws Exception;

	List<BoardDTO> getPage(Map map) throws Exception;

	List<BoardDTO> getSearchSelectPage(SearchCondition sc) throws Exception;

	int getSearchResultCnt(SearchCondition sc) throws Exception;

//	int updateCommentsCnt(int cnt, Integer b_num) throws Exception;
}