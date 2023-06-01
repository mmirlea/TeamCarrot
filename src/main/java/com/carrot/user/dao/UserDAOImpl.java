package com.carrot.user.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carrot.user.domain.UserDTO;

@Repository
public class UserDAOImpl implements UserDAO {
	@Autowired
	SqlSession session;
	
	String namespace = "com.carrot.user.dao.UserMapper.";
	
	@Override
	public int register(UserDTO dto) throws Exception{
		return session.insert(namespace + "register", dto);
	}
	
	@Override
	public int emailOverlap(UserDTO dto) throws Exception{
		return session.selectOne(namespace+"emailOverlap", dto);
	}
	
	@Override
	public UserDTO login(UserDTO dto) throws Exception{
		return session.selectOne(namespace+"login", dto);
	}

	@Override
	public UserDTO mypageInfo(String m_email) throws Exception {
		return session.selectOne(namespace+"mypageInfo", m_email);
	}

	@Override
	public int modify(UserDTO dto) throws Exception {
		return session.update(namespace+"modify", dto);
	}
}
