package com.carrot.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carrot.board.domain.CommentspDTO;

@Repository
public class CommentspDAOImpl implements CommentspDAO {

	@Autowired
	SqlSession session;

	String namespace = "com.carrot.board.dao.CommentspMapper.";

	@Override
	public int deleteAll(Integer cp_pnum) throws Exception {
		return session.delete(namespace + "deleteAll", cp_pnum);
	}

	@Override
	public int count(Integer cp_pnum) throws Exception {
		return session.selectOne(namespace + "count", cp_pnum);
	}

	@Override
	public int delete(Integer cp_num, String cp_email) throws Exception {
		Map map = new HashMap();
		map.put("cp_num", cp_num);
		map.put("cp_email", cp_email);

		return session.delete(namespace + "delete", map);
	}

	@Override
	public int insert(CommentspDTO dto) throws Exception {
		return session.insert(namespace + "insert", dto);
	}

	@Override
	public List<CommentspDTO> selectAll(Integer cp_pnum) throws Exception {
		return session.selectList(namespace + "selectAll", cp_pnum);
	}

	@Override
	public CommentspDTO select(Integer cp_num) throws Exception {
		return session.selectOne(namespace + "select", cp_num);
	}

	@Override
	public int update(CommentspDTO dto) throws Exception {
		return session.update(namespace + "update", dto);
	}
}
