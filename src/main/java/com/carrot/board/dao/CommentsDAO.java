package com.carrot.board.dao;

import java.util.List;

import com.carrot.board.domain.CommentsDTO;

public interface CommentsDAO {

	int deleteAll(Integer c_pnum) throws Exception;

	int count(Integer c_pnum) throws Exception;

	int delete(Integer c_num, String c_email) throws Exception;

	int insert(CommentsDTO dto) throws Exception;

	List<CommentsDTO> selectAll(Integer c_pnum) throws Exception;

	CommentsDTO select(Integer c_num) throws Exception;

	int update(CommentsDTO dto) throws Exception;

}