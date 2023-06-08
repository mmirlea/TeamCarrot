package com.carrot.board.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.carrot.board.domain.CommentspDTO;

public interface CommentspService {

	//댓글 개수
	int getCount(Integer cp_pnum) throws Exception;

	//게시글의 모든 댓글
	List<CommentspDTO> getList(Integer cp_pnum) throws Exception;

	//댓글 내용 가져오기
	CommentspDTO read(Integer cp_num) throws Exception;

	//댓글 수정
	int modify(CommentspDTO commentspDTO) throws Exception;

	//댓글 작성 (댓글 수 증가)
	int write(CommentspDTO commentspDTO) throws Exception;

	//댓글 지우기 (댓글 수 감소)
	int remove(Integer cp_num, String cp_email, Integer cp_pnum) throws Exception;

}