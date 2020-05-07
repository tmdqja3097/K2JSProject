package com.k2js.p1.match;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MatchService {

	@Autowired
	private MatchDAO matchDAO;
	
	public List<MatchVO> matchList() throws Exception{
		return matchDAO.matchList();
	}
}
