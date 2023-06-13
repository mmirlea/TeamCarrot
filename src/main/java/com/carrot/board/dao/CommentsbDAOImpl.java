package com.carrot.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carrot.board.domain.CommentsbDTO;

@Repository
public class CommentsbDAOImpl implements CommentsbDAO {
	
	@Autowired
	SqlSession session;
	
	String namespace = "com.carrot.board.dao.CommentsbMapper.";
	
	@Override
	public int deleteAll(Integer cb_pnum) throws Exception{
		return session.delete(namespace + "deleteAll", cb_pnum);
	}
	
	@Override
	public int count(Integer cb_pnum) throws Exception{
		return session.selectOne(namespace + "count", cb_pnum);
	}
	
	@Override
	public int delete(Integer cb_num, String cb_email) throws Exception{
		Map map = new HashMap();
		map.put("cb_num", cb_num);
		map.put("cb_email", cb_email);
		
		return session.delete(namespace + "delete", map);
	}
	
	@Override
	public int insert(CommentsbDTO dto) throws Exception{
		return session.insert(namespace + "insert", dto);
	}
	
	@Override
	public List<CommentsbDTO> selectAll(Integer cb_pnum) throws Exception{
		return session.selectList(namespace + "selectAll", cb_pnum);
	}
	
	@Override
	public CommentsbDTO select(Integer cb_num) throws Exception{
		return session.selectOne(namespace + "select", cb_num);
	}
	
	@Override
	public int update(CommentsbDTO dto) throws Exception{
		return session.update(namespace + "update", dto);
	}
}
