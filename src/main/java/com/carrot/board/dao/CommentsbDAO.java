package com.carrot.board.dao;

import java.util.List;

import com.carrot.board.domain.CommentsbDTO;

public interface CommentsbDAO {

	int deleteAll(Integer cb_pnum) throws Exception;

	int count(Integer cb_pnum) throws Exception;

	int delete(Integer cb_num, String cb_email) throws Exception;

	int insert(CommentsbDTO dto) throws Exception;

	List<CommentsbDTO> selectAll(Integer cb_pnum) throws Exception;

	CommentsbDTO select(Integer cb_num) throws Exception;

	int update(CommentsbDTO dto) throws Exception;

}