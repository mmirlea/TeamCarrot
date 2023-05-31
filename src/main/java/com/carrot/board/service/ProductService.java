package com.carrot.board.service;

import java.util.List;

import com.carrot.board.domain.ProductDTO;

public interface ProductService {

	ProductDTO read(Integer p_num) throws Exception;

	int getCount() throws Exception;

	int write(ProductDTO dto) throws Exception;

	int modify(ProductDTO dto) throws Exception;

	int remove(Integer p_num, String p_email) throws Exception;

	int removeAll() throws Exception;
	
	List<ProductDTO> selectAll() throws Exception;


}