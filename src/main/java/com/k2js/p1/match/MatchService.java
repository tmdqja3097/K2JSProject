package com.k2js.p1.match;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MatchService {

	@Autowired
	private MatchDAO matchDAO;
	
	public Date matchDate(MatchVO matchVO) throws Exception{
		return matchDAO.matchDate(matchVO);
	}
	
	public List<MatchVO> matchList(Date date) throws Exception{
		return matchDAO.matchList(date);
	}
}
