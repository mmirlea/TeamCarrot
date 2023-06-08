package com.carrot.board.dao;

import java.util.List;

import com.carrot.board.domain.CommentspDTO;

public interface CommentspDAO {

	int deleteAll(Integer cp_pnum) throws Exception;

	int count(Integer cp_pnum) throws Exception;

	int delete(Integer cp_num, String cp_email) throws Exception;

	int insert(CommentspDTO dto) throws Exception;

	List<CommentspDTO> selectAll(Integer cp_pnum) throws Exception;

	CommentspDTO select(Integer cp_num) throws Exception;

	int update(CommentspDTO dto) throws Exception;

}