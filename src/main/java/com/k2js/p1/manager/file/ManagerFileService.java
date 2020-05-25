package com.k2js.p1.manager.file;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.k2js.p1.board.file.BoardFileDAO;
import com.k2js.p1.board.file.BoardFileVO;

@Service
public class ManagerFileService {
	
	@Autowired
	private ManagerFileDAO managerFileDAO;
	
	public ManagerFileVO fileSelect(ManagerFileVO managerFileVO)throws Exception{
		return managerFileDAO.fileSelect(managerFileVO);
	}
	
	public int fileDelete(Long fileNum)throws Exception{
		return managerFileDAO.fileDelete(fileNum);
	}
}
