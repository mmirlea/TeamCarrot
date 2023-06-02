package com.carrot.user.dao;

import com.carrot.user.domain.UserDTO;

public interface UserDAO {

	int register(UserDTO dto) throws Exception;

	int emailOverlap(UserDTO dto) throws Exception;

	UserDTO login(UserDTO dto) throws Exception;
	
	UserDTO mypageInfo(String m_email) throws Exception;
	
	int modify(UserDTO dto) throws Exception;
	
	int modNoImg(UserDTO dto) throws Exception;

	int modifyPw(UserDTO dto) throws Exception;
	
	int modifyAddr(UserDTO dto) throws Exception;
}