package com.k2js.p1.board.file;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.k2js.p1.board.file.BoardFileDAO;
import com.k2js.p1.board.file.BoardFileVO;

@Service
public class BoardFileService {
	@Autowired
	private BoardFileDAO boardFileDAO;
	
	public BoardFileVO fileSelect(BoardFileVO boardFileVO)throws Exception{
		return boardFileDAO.fileSelect(boardFileVO);
	}
	
	public int fileDelete(Long fileNum)throws Exception{
		return boardFileDAO.fileDelete(fileNum);
	}

}
