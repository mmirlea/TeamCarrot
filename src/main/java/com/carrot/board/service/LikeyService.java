package com.carrot.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carrot.board.dao.LikeyDAO;
import com.carrot.board.domain.LikeyDTO;

@Service
public class LikeyService {

	@Autowired
	LikeyDAO likeyDAO;
	
	public int insertLike(LikeyDTO likeyDTO) throws Exception{
		return likeyDAO.insertLike(likeyDTO);
	}
	
	public int deleteLike(LikeyDTO likeyDTO) throws Exception{
		return likeyDAO.deleteLike(likeyDTO);
	}
}
