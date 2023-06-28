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
	@Autowired
	FileService fileService;
	
	//전체 게시물 개수 조회
	@Override
	public int getCount() throws Exception {
		return productDAO.count();
	}
	
	//게시글 목록 조회
	@Override
	public List<ProductDTO> selectAll() throws Exception {
		return productDAO.selectAll();
	}
	
	//게시글 읽어오기
	@Override
	public ProductDTO select(ProductDTO dto) throws Exception{
		return productDAO.select(dto);
	}
	
	//게시글 읽어오기 + 게시글 조회수 증가
	@Override
	public ProductDTO read(ProductDTO dto) throws Exception {
		dto = productDAO.select(dto);
		productDAO.increaseViewCnt(dto.getP_num());
		return dto;
	}

	//게시글 페이징 처리
	@Override
	public List<ProductDTO> getPage(SearchConditionP scp) throws Exception{
		return productDAO.selectPage(scp);
	}
	
	//게시글 검색하기
	@Override
	public List<ProductDTO> getSearchSelectPage(SearchConditionP scp) throws Exception{
		return productDAO.searchSelectPage(scp);
	}
	
	//게시글 검색했을 때 게시글 개수 조회
	@Override
	public int getSearchResultCnt(SearchConditionP scp) throws Exception{
		return productDAO.searchResultCnt(scp);
	}
	
	//게시글 추가하기
	@Override
	public int write(ProductDTO dto) throws Exception {
		dto.setP_img(fileService.createFile(dto.getFileUpload_p()));
		return productDAO.insert(dto);
	}

	//게시글 임시 저장하기
	@Override
	public int save(ProductDTO dto) throws Exception{
		dto.setP_img(fileService.createFile(dto.getFileUpload_p()));
		return productDAO.save(dto);
	}
	
	//게시글 수정하기
	@Override
	public int modify(ProductDTO dto) throws Exception {
		dto.setP_img(fileService.createFile(dto.getFileUpload_p()));
		return productDAO.update(dto);
	}
	
	//게시글 삭제하기
	@Override
	public int remove(Integer p_num, String p_email) throws Exception {
		return productDAO.delete(p_num, p_email);
	}
	
	//게시글 전체 삭제하기ㄴ
	public int removeAll() throws Exception {
		return productDAO.deleteAll();
	}


		
	
	



}
