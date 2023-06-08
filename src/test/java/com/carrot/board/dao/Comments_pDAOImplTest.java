package com.carrot.board.dao;

import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.carrot.board.domain.CommentspDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class Comments_pDAOImplTest {
	
	@Autowired
	Comments_pDAO commentsDao;
	
	@Test
	public void count() throws Exception{
		commentsDao.deleteAll(1);
		assertTrue(commentsDao.count(1)==0);
	}
	
//	@Test
//	public void delete() throws Exception{
//		commentsDao.deleteAll(1);
//		
//		CommentsDTO commentsDto = new CommentsDTO(1, 0, "commenter", "comment");
//		
//		assertTrue(commentsDao.insert(commentsDto)==1);
//		
//		assertTrue(commentsDao.delete(59, "green1")==1);
//	}
//	
//	@Test
//	public void insert() throws Exception{
//		commentsDao.deleteAll(1);
//		CommentsDTO commentsDto = new CommentsDTO(1, 0, "comment", "green1");
//		
//		assertTrue(commentsDao.insert(commentsDto) ==1);
//		
//		commentsDto = new CommentsDTO(1, 0, "comment2", "green1");
//		assertTrue(commentsDao.insert(commentsDto) ==1);
//		assertTrue(commentsDao.count(1)==2);
//	}
//	
//	@Test
//	public void selectAll() throws Exception{
//		commentsDao.deleteAll(1);
//		CommentsDTO commentsDto = new CommentsDTO(1, 0, "comment", "green1");
//		
//		assertTrue(commentsDao.insert(commentsDto) ==1);
//		assertTrue(commentsDao.count(1)==1);
//		
//		List<CommentsDTO> list = commentsDao.selectAll(1);
//		assertTrue(list.size()==1);
//		
//		commentsDto = new CommentsDTO(1, 0, "comment", "green1");
//		
//		assertTrue(commentsDao.insert(commentsDto) ==1);
//		assertTrue(commentsDao.count(1)==2);
//		
//		list = commentsDao.selectAll(1);
//		assertTrue(list.size()==2);
//		
//	}
//	
//	@Test
//	public void select() throws Exception{
//		commentsDao.deleteAll(1);
//		
//		CommentsDTO commentsDto = new CommentsDTO(1, 0, "comment", "green1");
//		assertTrue(commentsDao.insert(commentsDto)==1);
//		assertTrue(commentsDao.count(1) ==1);
//		
//		List<CommentsDTO> list = commentsDao.selectAll(1);
//		String comments = list.get(0).getC_content();
//		String commenter = list.get(0).getC_email();
//		assertTrue(comments.equals(commentsDto.getC_content()));
//		assertTrue(commenter.equals(commentsDto.getC_email()));
//	}
//	
//	@Test
//	public void update() throws Exception{
//		commentsDao.deleteAll(1);
//		CommentsDTO commentsDto = new CommentsDTO(1, 0, "comment", "green1");
//		assertTrue(commentsDao.insert(commentsDto)==1);
//		assertTrue(commentsDao.count(1)==1);
//		
//		List<CommentsDTO> list = commentsDao.selectAll(1);
//		commentsDto.setC_num(list.get(0).getC_num());
//		commentsDto.setC_content("comment2");
//		assertTrue(commentsDao.update(commentsDto)==1);
//		
//		list = commentsDao.selectAll(1);
//		String comments = list.get(0).getC_content();
//		String commenter =list.get(0).getC_email();
//		assertTrue(comments.equals(commentsDto.getC_content()));
//		assertTrue(commenter.equals(commentsDto.getC_email()));
//	}

}
