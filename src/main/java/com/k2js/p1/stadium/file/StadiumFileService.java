package com.k2js.p1.stadium.file;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.k2js.p1.stadium.file.StadiumFileDAO;

@Service
public class StadiumFileService {
	@Autowired
	private StadiumFileDAO stadiumFileDAO;
	
	public StadiumFileVO fileSelect(StadiumFileVO stadiumFileVO)throws Exception{
		return stadiumFileDAO.fileSelect(stadiumFileVO);
	}
	
	public int fileDelete(Long fileNum)throws Exception{
		return stadiumFileDAO.fileDelete(fileNum);
	}
}
