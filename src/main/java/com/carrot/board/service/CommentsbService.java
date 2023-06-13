package com.carrot.board.service;

import java.util.List;

import com.carrot.board.domain.CommentsbDTO;

public interface CommentsbService {

	//댓글 개수
	int getCount(Integer cb_pnum) throws Exception;

	//게시글의 모든 댓글
	List<CommentsbDTO> getList(Integer cb_pnum) throws Exception;

	//댓글 내용 가져오기
	CommentsbDTO read(Integer cb_num) throws Exception;

	//댓글 수정
	int modify(CommentsbDTO commentsbDTO) throws Exception;

	//댓글 작성 (댓글 수 증가)
	int write(CommentsbDTO commentsbDTO) throws Exception;

	//댓글 지우기 (댓글 수 감소)
	int removep(Integer cb_num, String cb_email, Integer cb_pnum) throws Exception;

}