package com.carrot.board.dao;

import java.util.List;
import java.util.Map;

import com.carrot.board.domain.BoardDTO;
import com.carrot.board.domain.SearchCondition;

public interface BoardDAO {

	BoardDTO select(Integer b_num) throws Exception;

	int count() throws Exception;

	int insert(BoardDTO boardDto) throws Exception;

	int update(BoardDTO boardDto) throws Exception;

	int delete(Integer b_num, String b_email) throws Exception;

	int deleteAll() throws Exception;

	List<BoardDTO> selectAll() throws Exception;

	int increaseViewCnt(Integer b_num) throws Exception;

	List<BoardDTO> selectPage(Map map) throws Exception;

	List<BoardDTO> searchSelectPage(SearchCondition sc) throws Exception;

	int searchResultCnt(SearchCondition sc) throws Exception;

//	int updateCommentsCnt(int cnt, Integer b_num) throws Exception;
}