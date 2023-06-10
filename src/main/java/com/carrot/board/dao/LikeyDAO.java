package com.carrot.board.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carrot.board.domain.LikeyDTO;

@Repository
public class LikeyDAO {

	@Autowired
	SqlSession session;

	String namespace = "com.carrot.board.dao.LikeyMapper.";
	
	public int insertLike(LikeyDTO likeyDTO) throws Exception {
		return session.insert(namespace + "insertLike", likeyDTO);
	}
	
	public int deleteLike(LikeyDTO likeyDTO) throws Exception {
		return session.delete(namespace + "deleteLike", likeyDTO);
	}
	
	public int count(LikeyDTO likeyDTO) throws Exception {
		return session.selectOne(namespace + "count", likeyDTO);
	}
}
