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
	
	//전체 게시물 개수 조회
	@Override
	public int count() throws Exception{
		return session.selectOne(namespace + "count");
	}
	
	//게시글 목록 조회
	@Override
	public List<ProductDTO> selectAll() throws Exception{
		return session.selectList(namespace + "selectAll");
	}
	
	//게시글 읽어오기
	@Override
	public ProductDTO select(ProductDTO dto) throws Exception{
		return session.selectOne(namespace + "select", dto);
	}

	//게시글 페이징 처리
	@Override
	public List<ProductDTO> selectPage (SearchConditionP scp) throws Exception{
		return session.selectList(namespace + "selectPage", scp);
	}
	
	//게시글 검색하기
	@Override
	public List<ProductDTO> searchSelectPage(SearchConditionP scp) throws Exception{
		return session.selectList(namespace + "searchSelectPage", scp);
	}
	
	//게시글 검색했을 때 게시글 개수 조회
	@Override
	public int searchResultCnt(SearchConditionP scp)throws Exception{
		return session.selectOne(namespace + "searchResultCnt", scp);
	}
	
	//게시글 추가하기
	@Override
	public int insert(ProductDTO dto) throws Exception{
		return session.insert(namespace + "insert", dto);
	}
	
	//임시저장하기
	@Override
	public int save(ProductDTO dto) throws Exception{
		return session.insert(namespace + "save", dto);
	}
	
	//게시글 수정하기
	@Override
	public int update(ProductDTO dto) throws Exception{
		return session.update(namespace + "update", dto);
	}

	//게시글 조회수 증가하기
	@Override
	public int increaseViewCnt(Integer p_num) throws Exception{
		return session.update(namespace + "increaseViewCnt", p_num);
	}
	
	//게시글 댓글 추가하기
	@Override
	public int updateCommentspCnt(Integer p_num, int cnt) throws Exception {
		Map map = new HashMap();
		map.put("cnt", cnt);
		map.put("p_num", p_num);
		return session.update(namespace + "updateCommentspCnt", map);
	}
	
	//게시글 삭제하기
	@Override
	public int delete(Integer p_num, String p_email) throws Exception {
		Map map = new HashMap();
		map.put("p_num", p_num);
		map.put("p_email", p_email);
		return session.delete(namespace + "delete", map);
	}
	
	//게시글 전체 삭제
	@Override
	public int deleteAll() throws Exception {
		return session.delete(namespace + "deleteAll");
	}

}
