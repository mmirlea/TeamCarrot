package com.carrot.user.dao;

import java.util.List;

import com.carrot.board.domain.ProductDTO;
import com.carrot.board.domain.SearchConditionM;
import com.carrot.user.domain.UserDTO;

public interface UserDAO {

	//가입
	int register(UserDTO dto) throws Exception;

	//이메일 중복
	int emailOverlap(UserDTO dto) throws Exception;

	//로그인
	UserDTO login(UserDTO dto) throws Exception;
	
	//내 프로필 정보 가져오기
	UserDTO mypageInfo(String m_email) throws Exception;
	
	//수정(프로필 사진, 닉네임)
	int modify(UserDTO dto) throws Exception;
	
	//닉네임만 수정
	int modNoImg(UserDTO dto) throws Exception;

	//비밀번호 변경
	int modifyPw(UserDTO dto) throws Exception;
	
	//주소 변경
	int modifyAddr(UserDTO dto) throws Exception;
	
	//탈퇴
	int delUser(UserDTO dto) throws Exception;
	

	int count() throws Exception;
	
	List<ProductDTO> selectPage (SearchConditionM scm) throws Exception;

}