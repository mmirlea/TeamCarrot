package com.carrot.user.service;

import com.carrot.user.domain.UserDTO;

public interface UserService {

	int register(UserDTO dto) throws Exception;

	int emailOverlap(UserDTO dto) throws Exception;

	UserDTO login(UserDTO dto) throws Exception;

	UserDTO mypageInfo(String m_email) throws Exception;
	
	int modify(UserDTO dto) throws Exception;
}