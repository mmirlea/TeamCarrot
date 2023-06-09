package com.carrot.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carrot.board.domain.BoardDTO;
import com.carrot.board.domain.SearchCondition;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	SqlSession session;

	String namespace = "com.carrot.board.dao.BoardMapper.";

	@Override
	public BoardDTO select(BoardDTO boardDTO) throws Exception {
		return session.selectOne(namespace + "select", boardDTO);
	}

	@Override
	public int count() throws Exception {
		return session.selectOne(namespace + "count");
	}

	@Override
	public int insert(BoardDTO boardDto) throws Exception {
		return session.insert(namespace + "insert", boardDto);
	}

	@Override
	public int save(BoardDTO boardDto) throws Exception {
		return session.insert(namespace + "save", boardDto);
	}

	@Override
	public int update(BoardDTO boardDto) throws Exception {
		return session.update(namespace + "update", boardDto);
	}

	@Override
	public int delete(Integer b_num, String b_email) throws Exception {
		Map map = new HashMap();
		map.put("b_num", b_num);
		map.put("b_email", b_email);
		return session.delete(namespace + "delete", map);
	}

	@Override
	public int deleteAll() throws Exception {
		return session.delete(namespace + "deleteAll");
	}

	@Override
	public List<BoardDTO> selectAll() throws Exception {
		return session.selectList(namespace + "selectAll");
	}

	@Override
	public int increaseViewCnt(Integer b_num) throws Exception {
		return session.update(namespace + "increaseViewCnt", b_num);
	}

	@Override
	public int increaseLikeCnt(Integer b_num, BoardDTO boardDto) throws Exception {
		return session.update(namespace + "increaseLikeCnt", b_num);
	}

	@Override
	public int decreaseLikeCnt(Integer b_num, BoardDTO boardDto) throws Exception {
		return session.update(namespace + "decreaseLikeCnt", b_num);
	}

	@Override
	public List<BoardDTO> selectPage(Map map) throws Exception {
		return session.selectList(namespace + "selectPage", map);
	}

	@Override
	public List<BoardDTO> searchSelectPage(SearchCondition sc) throws Exception {
		return session.selectList(namespace + "searchSelectPage", sc);
	}

	@Override
	public int searchResultCnt(SearchCondition sc) throws Exception {
		return session.selectOne(namespace + "searchResultCnt", sc);
	}

	@Override
	public int updateCommentsbCnt(int cnt, Integer b_num) throws Exception {
		Map map = new HashMap();
		map.put("cnt", cnt);
		map.put("b_num", b_num);
		return session.update(namespace + "updateCommentsbCnt", map);
	}

}
