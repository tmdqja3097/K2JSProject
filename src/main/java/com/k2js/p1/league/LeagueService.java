package com.k2js.p1.league;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LeagueService {

	@Autowired
	private LeagueDAO leagueDAO;
	
	public List<LeagueVO> leagueMaleList(String teamName) throws Exception{
		LeagueVO leagueVO = new LeagueVO();
		leagueVO.setTeamName(teamName);
		
		return leagueDAO.leagueMaleList(leagueVO);
	}
	
	public List<LeagueVO> leagueFemaleList(String teamName) throws Exception{
		return leagueDAO.leagueFemaleList(teamName);
	}
	
	public int leagueMaleWrite(LeagueVO leagueVO) throws Exception{
		return leagueDAO.leagueMaleWrite(leagueVO);
	}
}
