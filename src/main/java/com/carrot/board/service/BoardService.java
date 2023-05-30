package com.carrot.board.service;

import java.util.List;

import com.carrot.board.domain.BoardDTO;
import org.springframework.stereotype.Service;

@Service
public interface BoardService {

	int getCount() throws Exception;

	int write(BoardDTO boardDTO) throws Exception;

	int modify(BoardDTO boardDTO) throws Exception;

	int remove(Integer bno, String writer) throws Exception;

	int removeAll() throws Exception;

	List<BoardDTO> getAll() throws Exception;

	// 읽을 때 조회되도록 한번에 묶어서 사용
	BoardDTO read(int bno) throws Exception;

}