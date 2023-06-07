package com.carrot.board.service;

import java.util.List;

import com.carrot.board.domain.ProductDTO;
import com.carrot.board.domain.SearchConditionP;

public interface ProductService {

	ProductDTO read(Integer p_num) throws Exception;

	int getCount() throws Exception;

	int write(ProductDTO dto) throws Exception;
	
	int save(ProductDTO dto) throws Exception;
	
	int modify(ProductDTO dto) throws Exception;

	int remove(Integer p_num, String p_email) throws Exception;

	int removeAll() throws Exception;
	
	List<ProductDTO> selectAll() throws Exception;
	
	int increaseLikeCnt(int p_num, ProductDTO productDTO) throws Exception;
	
	int decreaseLikeCnt(String p_likeyEmail, ProductDTO productDTO) throws Exception;
	
	String getLikeyEmail(ProductDTO productDTO) throws Exception;

	List<ProductDTO> getPage(SearchConditionP scp) throws Exception;
	
	List<ProductDTO> getSearchSelectPage(SearchConditionP scp) throws Exception;
	
	int getSearchResultCnt(SearchConditionP scp) throws Exception;
	
	ProductDTO select(Integer p_num) throws Exception;
}