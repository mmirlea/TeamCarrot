package com.carrot.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carrot.board.dao.BoardDAO;
import com.carrot.board.domain.BoardDTO;
import com.carrot.board.domain.SearchCondition;

@Service
public class BoardServiceImple implements BoardService {

	@Autowired
	BoardDAO boardDAO;

	@Autowired
	FileService fileService;

	@Override
	public BoardDTO select(BoardDTO boardDTO) throws Exception {
		return boardDAO.select(boardDTO);
	}

	public int getCount() throws Exception {
		return boardDAO.count();
	}

	@Override
	public int write(BoardDTO boardDTO) throws Exception {
		boardDTO.setB_img(fileService.createFile(boardDTO.getFileUpload())); // 이미지 저장
		return boardDAO.insert(boardDTO);
	}

	@Override
	public int save(BoardDTO boardDTO) throws Exception {
		boardDTO.setB_img(fileService.createFile(boardDTO.getFileUpload())); // 이미지 저장
		return boardDAO.save(boardDTO);
	}

	@Override
	public int modify(BoardDTO boardDTO) throws Exception {
		boardDTO.setB_img(fileService.createFile(boardDTO.getFileUpload()));
		return boardDAO.update(boardDTO);
	}

	@Override
	public int remove(Integer b_num, String b_email) throws Exception {
		return boardDAO.delete(b_num, b_email);
	}

	@Override
	public int removeAll() throws Exception {
		return boardDAO.deleteAll();
	}

	@Override
	public List<BoardDTO> getAll() throws Exception {
		return boardDAO.selectAll();
	}

	// 읽을 때 조회되도록 한번에 묶어서 사용
	@Override
	public BoardDTO read(BoardDTO boardDTO) throws Exception {
		boardDTO = boardDAO.select(boardDTO);
		boardDAO.increaseViewCnt(boardDTO.getB_num());
		return boardDTO;
	}

	@Override
	public int increaseLikeCnt(Integer b_num, BoardDTO boardDto) throws Exception {
		return boardDAO.increaseLikeCnt(b_num, boardDto);
	}

	@Override
	public int decreaseLikeCnt(Integer b_num, BoardDTO boardDto) throws Exception {
		return boardDAO.decreaseLikeCnt(b_num, boardDto);
	}

	// 페이징 처리
	@Override
	public List<BoardDTO> getPage(Map map) throws Exception {
		return boardDAO.selectPage(map);
	}

	@Override
	public List<BoardDTO> getSearchSelectPage(SearchCondition sc) throws Exception {
		return boardDAO.searchSelectPage(sc);
	}

	@Override
	public int getSearchResultCnt(SearchCondition sc) throws Exception {
		return boardDAO.searchResultCnt(sc);
	}

	@Override
	public int updateCommentsCnt(int cnt, Integer b_num) throws Exception {
		return boardDAO.updateCommentsbCnt(cnt, b_num);
	}

}
