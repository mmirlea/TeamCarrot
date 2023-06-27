package com.carrot.board.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.carrot.board.service.FileService;

@Controller
public class FileController {

	@Autowired
	FileService fileService;

	// 파일 저장하기
	@GetMapping("/file/{fileName}")
	public void findFile(@PathVariable("fileName") String fileName, HttpServletResponse response) throws Exception {
		FileInputStream in = null;
		BufferedOutputStream out = null;
		try {
			File file = fileService.searchFile(fileName);
			String originalName = new String(fileName.getBytes("utf-8"), "iso-8859-1");
			response.setContentType("image/*");
			response.setHeader("Content-Disposition", "attachment;filename=\"" + originalName + "\";");
			if (file.exists()) {
				in = new FileInputStream(file);
				out = new BufferedOutputStream(response.getOutputStream());
				int len;
				byte[] buf = new byte[1024];
				while ((len = in.read(buf)) > 0) {
					out.write(buf, 0, len);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (out != null) {
				out.flush();
			}
			if (out != null) {
				out.close();
			}
			if (in != null) {
				in.close();
			}
		}

	}

	// 파일 삭제하기
	@GetMapping("/delFile/{fileName}")
	public boolean delFile(@PathVariable("fileName") String fileName) {
		return fileService.deleteFile(fileName);
	}

}
