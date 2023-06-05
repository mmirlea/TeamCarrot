package com.carrot.board.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.carrot.board.domain.CommentsDTO;

public interface CommentsService {

	//댓글 개수
	int getCount(Integer c_pnum) throws Exception;

	//게시글의 모든 댓글
	List<CommentsDTO> getList(Integer c_pnum) throws Exception;

	//댓글 내용 가져오기
	CommentsDTO read(Integer c_num) throws Exception;

	//댓글 수정
	int modify(CommentsDTO commentsDTO) throws Exception;

	//댓글 작성 (댓글 수 증가)
	int write(CommentsDTO commentsDTO) throws Exception;

	//댓글 지우기 (댓글 수 감소)
	int remove(Integer c_num, String c_email, Integer c_pnum) throws Exception;

}