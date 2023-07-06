package com.carrot.user.service;

import java.util.List;

import com.carrot.board.domain.ProductDTO;
import com.carrot.board.domain.SearchConditionM;
import com.carrot.user.domain.UserDTO;

public interface UserService {

	int register(UserDTO dto) throws Exception;

	int emailOverlap(UserDTO dto) throws Exception;

	UserDTO login(UserDTO dto) throws Exception;

	UserDTO mypageInfo(String m_email) throws Exception;

	int modify(UserDTO dto) throws Exception;

	int modNoImg(UserDTO dto) throws Exception;

	int modifyPw(UserDTO dto) throws Exception;

	int modifyAddr(UserDTO dto) throws Exception;

	int delUser(UserDTO dto) throws Exception;

	int getCount() throws Exception;

	List<ProductDTO> getPage(SearchConditionM scm) throws Exception;

}