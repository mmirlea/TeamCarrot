package com.carrot.board.dao;

import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.carrot.board.domain.BoardDTO;
import com.carrot.board.domain.ProductDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class ProductDAOImplTest {

	@Autowired
	ProductDAO productDAO;
	
	@Test
	public void selectAllTest() throws Exception {
		productDAO.deleteAll();
		assertTrue(productDAO.count() == 0);
		
		List<ProductDTO> list = productDAO.selectAll();
		assertTrue(list.size() == 0);
		
		ProductDTO productDTO = new ProductDTO("1", "생활/가전", "blue@naver.com", "티비팔아요", "얼마안썼어요", "n", 30000);
		assertTrue(productDAO.insert(productDTO) == 1);
		
		list = productDAO.selectAll();
		assertTrue(list.size() == 1);
	}
}
