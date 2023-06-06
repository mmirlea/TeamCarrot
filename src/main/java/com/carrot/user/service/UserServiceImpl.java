package com.carrot.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carrot.board.domain.ProductDTO;
import com.carrot.board.domain.SearchConditionM;
import com.carrot.user.dao.UserDAO;
import com.carrot.user.domain.UserDTO;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserDAO dao;
	
	@Override
	public int register(UserDTO dto) throws Exception{
		return dao.register(dto);
	}
	
	@Override
	public int emailOverlap(UserDTO dto) throws Exception{
		return dao.emailOverlap(dto);
	}
	
	@Override
	public UserDTO login(UserDTO dto) throws Exception{
		return dao.login(dto);
	}

	@Override
	public UserDTO mypageInfo(String m_email) throws Exception {
		return dao.mypageInfo(m_email);
	}

	@Override
	public int modify(UserDTO dto) throws Exception {
		return dao.modify(dto);
	}

	@Override
	public int modifyPw(UserDTO dto) throws Exception {
		return dao.modifyPw(dto);
	}

	@Override
	public int modifyAddr(UserDTO dto) throws Exception {
		return dao.modifyAddr(dto);
	}

	@Override
	public int modNoImg(UserDTO dto) throws Exception {
		return dao.modNoImg(dto);
	}

	@Override
	public int delUser(UserDTO dto) throws Exception {
		return dao.delUser(dto);
	}
	
	@Override
	public int getCount() throws Exception {
		return dao.count();
	}
	
	public List<ProductDTO> getPage(SearchConditionM scm) throws Exception{
		return dao.selectPage(scm);
	}
	
}
