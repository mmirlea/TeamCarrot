package com.carrot.board.dao;

import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class BoardDAOImplTest {

	@Autowired
	BoardDAO boardDAO;

	@Test
	public void selectTest() throws Exception {
//		boardDAO.deleteAll();
		assertTrue(boardDAO.count() == 0);

//		BoardDTO boardDto = new BoardDTO("동네소식", "hello@naver.com", "no title", "no content");
//		assertTrue(boardDAO.insert(boardDto) == 1);

	}

}
