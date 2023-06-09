package com.carrot.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carrot.board.domain.BoardDTO;
import com.carrot.board.domain.ProductDTO;
import com.carrot.board.domain.SearchConditionM;
import com.carrot.board.domain.SearchConditionP;

@Repository
public class ProductDAOImpl implements ProductDAO {
	
	@Autowired
	SqlSession session;
	
	String namespace = "com.carrot.board.dao.ProductMapper.";
	
	@Override
	public ProductDTO select(Integer p_num) throws Exception{
		return session.selectOne(namespace + "select", p_num);
	}
	
	@Override
	public int count() throws Exception{
		return session.selectOne(namespace + "count");
	}
	
	@Override
	public int insert(ProductDTO dto) throws Exception{
		return session.insert(namespace + "insert", dto);
	}
	
	public int save(ProductDTO dto) throws Exception{
		return session.insert(namespace + "save", dto);
	}
	
	@Override
	public int update(ProductDTO dto) throws Exception{
		return session.update(namespace + "update", dto);
	}
	
	@Override
	public int delete(Integer p_num, String p_email) throws Exception {
		Map map = new HashMap();
		map.put("p_num", p_num);
		map.put("p_email", p_email);
		return session.delete(namespace + "delete", map);
	}
	
	@Override
	public int deleteAll() throws Exception {
		return session.delete(namespace + "deleteAll");
	}
	
	@Override
	public List<ProductDTO> selectAll() throws Exception{
		return session.selectList(namespace + "selectAll");
	}

	@Override
	public int increaseViewCnt(Integer p_num) throws Exception{
		return session.update(namespace + "increaseViewCnt", p_num);
	}
	
	@Override
	public int increaseLikeCnt(Integer b_num) throws Exception {
		return session.update(namespace + "increaseLikeCnt", b_num);
	}

	@Override
	public int decreaseLikeCnt(Integer b_num) throws Exception {
		return session.update(namespace + "decreaseLikeCnt", b_num);
	}

	@Override
	public String getLikeyEmail(ProductDTO dto) throws Exception {
//		map = new HashMap();
//		map.put("p_num", p_num);
//		map.put("p_email", p_email);
		return session.selectOne(namespace + "getLikeyEmail", dto);
	}
	
	public List<ProductDTO> selectPage (SearchConditionP scp) throws Exception{
		return session.selectList(namespace + "selectPage", scp);
	}

	public List<ProductDTO> searchSelectPage(SearchConditionP scp) throws Exception{
		return session.selectList(namespace + "searchSelectPage", scp);
	}
	
	public int searchResultCnt(SearchConditionP scp)throws Exception{
		return session.selectOne(namespace + "searchResultCnt", scp);
	}
}
