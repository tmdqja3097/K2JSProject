package com.k2js.p1.stadium;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class StadiumService {
	@Autowired
	private StadiumDAO stadiumDAO;
	
	public StadiumVO stadiumSelect(String title) throws Exception{
		return stadiumDAO.stadiumSelect(title);
	}
}
