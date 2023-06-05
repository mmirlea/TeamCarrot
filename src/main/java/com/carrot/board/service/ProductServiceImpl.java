package com.carrot.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carrot.board.dao.ProductDAO;
import com.carrot.board.domain.ProductDTO;
import com.carrot.board.domain.SearchConditionP;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDAO productDAO;
	
	@Override
	public ProductDTO read(Integer p_num) throws Exception {
		ProductDTO productDTO = productDAO.select(p_num);
		productDAO.increaseViewCnt(p_num);
		return productDTO;
	}

	@Override
	public int getCount() throws Exception {
		return productDAO.count();
	}

	@Override
	public int write(ProductDTO dto) throws Exception {
		return productDAO.insert(dto);
	}

	@Override
	public int modify(ProductDTO dto) throws Exception {
		return productDAO.update(dto);
	}

	@Override
	public int remove(Integer p_num, String p_email) throws Exception {
		return productDAO.delete(p_num, p_email);
	}
	
	public int removeAll() throws Exception {
		return productDAO.deleteAll();
	}

	@Override
	public List<ProductDTO> selectAll() throws Exception {
		return productDAO.selectAll();
	}
	
	public List<ProductDTO> getPage(SearchConditionP scp) throws Exception{
		return productDAO.selectPage(scp);
	}
	
	public List<ProductDTO> getSearchSelectPage(SearchConditionP scp) throws Exception{
		return productDAO.searchSelectPage(scp);
	}
	
	public int getSearchResultCnt(SearchConditionP scp) throws Exception{
		return productDAO.searchResultCnt(scp);
	}
	
	public ProductDTO select(Integer p_num) throws Exception{
		return productDAO.select(p_num);
	}
}
