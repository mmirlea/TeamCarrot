package com.carrot.board.service;

import java.io.File;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileService {
	private static final String SAVE_PATH = "c:/carrot/uploads/";
	private static final String URL_PATH = "/carrot/file/";
	private MultipartFile uploadFile;

	// 파일 업로드 하기 위한 url 생성
	public String createFile(MultipartFile uploadFile) throws Exception {
		String fileName = uploadFile.getOriginalFilename();
		String url = URL_PATH + fileName;
		String saveFilePath = SAVE_PATH + fileName;
		if(!uploadFile.isEmpty()) {
			uploadFile.transferTo(new File(saveFilePath));	
			return url;
		}
		return "";
	}
	
	// 파일 찾기
	public File searchFile(String fileName) {
		String saveFilePath = SAVE_PATH + fileName;
		File file = new File(saveFilePath);
	
		return file;
	}
	
	public String getFilePath(String fileName) {
		return SAVE_PATH + fileName;
	}

	// 저장된 파일 주소를 불러와서 파일 삭제하기
	public boolean deleteFile(String fileName) {
		String saveFilePath = SAVE_PATH + fileName;
		File file = new File(saveFilePath);

		if (file.exists()) {
			return file.delete();
		} else {
			return false;
		}
	}
}
