package com.carrot.board.service;

import java.util.List;
import java.util.Map;

import com.carrot.board.domain.BoardDTO;
import com.carrot.board.domain.SearchCondition;

public interface BoardService {

	int getCount() throws Exception;

	int write(BoardDTO boardDTO) throws Exception;

	int modify(BoardDTO boardDTO) throws Exception;

	int remove(Integer bno, String writer) throws Exception;

	int removeAll() throws Exception;

	List<BoardDTO> getAll() throws Exception;

	// 읽을 때 조회되도록 한번에 묶어서 사용
	BoardDTO read(int bno) throws Exception;

	List<BoardDTO> getPage(Map map) throws Exception;

	List<BoardDTO> getSearchSelectPage(SearchCondition sc) throws Exception;

	int getSearchResultCnt(SearchCondition sc) throws Exception;

//	int updateCommentsCnt(int cnt, Integer b_num) throws Exception;
}