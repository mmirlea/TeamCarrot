package com.carrot.board.dao;

import java.util.List;

import com.carrot.board.domain.ProductDTO;
import com.carrot.board.domain.SearchConditionP;

public interface ProductDAO {

	ProductDTO select(Integer p_num) throws Exception;

	int count() throws Exception;

	int save(ProductDTO dto) throws Exception;
	
	int insert(ProductDTO dto) throws Exception;

	int update(ProductDTO dto) throws Exception;

	int delete(Integer p_num, String p_email) throws Exception;

	List<ProductDTO> selectAll() throws Exception;

	int deleteAll() throws Exception;
	
	int increaseViewCnt(Integer p_num) throws Exception;
	
	List<ProductDTO> selectPage (SearchConditionP scp) throws Exception;

	public List<ProductDTO> searchSelectPage(SearchConditionP scp) throws Exception;
	
	public int searchResultCnt(SearchConditionP scp)throws Exception;

}