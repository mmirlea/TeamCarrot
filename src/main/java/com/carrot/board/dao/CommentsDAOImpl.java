package com.carrot.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carrot.board.domain.CommentsDTO;

@Repository
public class CommentsDAOImpl {
	@Autowired
	SqlSession session;
	
	String namespace = "com.carrot.board.dao.CommentsMapper.";
	
	public int deleteAll(Integer c_pnum) throws Exception{
		return session.delete(namespace+"deleteAll", c_pnum);
	}
	
	public int count(Integer c_pnum) throws Exception{
		return session.selectOne(namespace+"count", c_pnum);
	}
	
	public int delete(Integer c_num, String c_email) throws Exception{
		Map map = new HashMap();
		map.put("c_num", c_num);
		map.put("c_email", c_email);
		return session.delete(namespace+"delete", map);
	}
	
	public int insert(CommentsDTO dto) throws Exception{
		return session.insert(namespace+"insert", dto);
	}
	
	public List<CommentsDTO> selectAll(Integer c_pnum) throws Exception{
		return session.selectList(namespace+"selectAll", c_pnum);
	}
	
	public CommentsDTO select(Integer c_num) throws Exception{
		return session.selectOne(namespace+"select", c_num);
	}
	
	public int update(CommentsDTO dto) throws Exception{
		return session.update(namespace+"update", dto);
	}
}
