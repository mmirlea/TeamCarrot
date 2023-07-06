package com.carrot.board.dao;

import java.util.List;

import com.carrot.board.domain.ProductDTO;
import com.carrot.board.domain.SearchConditionP;

public interface ProductDAO {

	//전체 게시물 개수 조회
	int count() throws Exception;
	
	//게시글 목록 조회
	List<ProductDTO> selectAll() throws Exception;
	
	//게시글 읽어오기
	ProductDTO select(ProductDTO dto) throws Exception;

	//게시글 페이징 처리ㄴ
	List<ProductDTO> selectPage (SearchConditionP scp) throws Exception;
	
	//게시글 검색하기
	public List<ProductDTO> searchSelectPage(SearchConditionP scp) throws Exception;
	
	//게시글 검색했을 때 게시글 개수
	public int searchResultCnt(SearchConditionP scp)throws Exception;
	
	//게시글 추가하기
	int insert(ProductDTO dto) throws Exception;
	
	//임시 저장하기
	int save(ProductDTO dto) throws Exception;
	
	//게시글 수정하기
	int update(ProductDTO dto) throws Exception;
	
	//게시글 조회수 증가하기
	int increaseViewCnt(Integer p_num) throws Exception;
	
	//게시글 댓글 추가하기
	int updateCommentspCnt(Integer p_num, int cnt) throws Exception;
	
	//게시글 삭제하기
	int delete(Integer p_num, String p_email) throws Exception;

	//게시글 전체 삭제하기
	int deleteAll() throws Exception;
	

}