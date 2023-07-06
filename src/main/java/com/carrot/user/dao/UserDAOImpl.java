package com.carrot.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carrot.board.domain.ProductDTO;
import com.carrot.board.domain.SearchConditionM;
import com.carrot.user.domain.UserDTO;

@Repository
public class UserDAOImpl implements UserDAO {
	@Autowired
	SqlSession session;

	String namespace = "com.carrot.user.dao.UserMapper.";

	@Override
	public int register(UserDTO dto) throws Exception {
		return session.insert(namespace + "register", dto);
	}

	@Override
	public int emailOverlap(UserDTO dto) throws Exception {
		return session.selectOne(namespace + "emailOverlap", dto);
	}

	@Override
	public UserDTO login(UserDTO dto) throws Exception {
		return session.selectOne(namespace + "login", dto);
	}

	@Override
	public UserDTO mypageInfo(String m_email) throws Exception {
		return session.selectOne(namespace + "mypageInfo", m_email);
	}

	@Override
	public int modify(UserDTO dto) throws Exception {
		return session.update(namespace + "modify", dto);
	}

	@Override
	public int modNoImg(UserDTO dto) throws Exception {
		return session.update(namespace + "modNoImg", dto);

	}

	@Override
	public int modifyPw(UserDTO dto) throws Exception {
		return session.update(namespace + "modifyPw", dto);
	}

	@Override
	public int modifyAddr(UserDTO dto) throws Exception {
		return session.update(namespace + "modifyAddr", dto);
	}

	@Override
	public int delUser(UserDTO dto) throws Exception {
		return session.delete(namespace + "delUser", dto);
	}

	@Override
	public int count() throws Exception {
		return session.selectOne(namespace + "count");
	}

	public List<ProductDTO> selectPage(SearchConditionM scm) throws Exception {
		return session.selectList(namespace + "selectPage", scm);
	}

}
