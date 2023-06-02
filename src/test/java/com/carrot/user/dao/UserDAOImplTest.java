package com.carrot.user.dao;

import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.carrot.board.dao.BoardDAO;
import com.carrot.user.domain.UserDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class UserDAOImplTest {

	@Autowired
	private UserDAO dao;
	
	@Autowired
	BoardDAO bDao;
	
	@Test
	public void test() throws Exception{
//		UserDTO dto = new UserDTO("abc@naver.com", "1234", "seq_member_num.nextval", "test3", null, "울산", "중구");
//		assertTrue(dao.register(dto)==1);
//		assertTrue(dto.getM_nicknm()=="test3");
//		
//		dto=new UserDTO("def@naver.com", "1234", "seq_member_num.nextval", "test4", null, "울산", "중구");
//		assertTrue(dao.register(dto)==1);
//		assertTrue(dto.getM_nicknm()=="test4");
		
	}
	
	
	

}
