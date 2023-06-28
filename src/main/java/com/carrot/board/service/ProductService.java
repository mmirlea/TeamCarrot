package com.carrot.board.service;

import java.util.List;

import com.carrot.board.domain.ProductDTO;
import com.carrot.board.domain.SearchConditionP;

public interface ProductService {

	//전체 게시물 개수 조회
	int getCount() throws Exception;
	
	//게시글 목록 조회
	List<ProductDTO> selectAll() throws Exception;
	
	//게시글 읽어오기
	ProductDTO select(ProductDTO dto) throws Exception;
	 
	//게시글 읽어오기 + 게시글 조회수 증가
	ProductDTO read(ProductDTO dto) throws Exception;
	
	//게시글 페이징 처리
	List<ProductDTO> getPage(SearchConditionP scp) throws Exception;
	
	//게시글 검색하기
	List<ProductDTO> getSearchSelectPage(SearchConditionP scp) throws Exception;
	
	//게시글 검색했을 때 게시글 개수 조회
	int getSearchResultCnt(SearchConditionP scp) throws Exception;

	//게시글 추가하기
	int write(ProductDTO dto) throws Exception;
	
	//게시글 임시 저장하기
	int save(ProductDTO dto) throws Exception;
	
	//게시글 수정하기
	int modify(ProductDTO dto) throws Exception;

	//게시글 삭제하기
	int remove(Integer p_num, String p_email) throws Exception;

	//게시글 전체 삭제하기
	int removeAll() throws Exception;
	
}