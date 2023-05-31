package com.carrot.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
}
