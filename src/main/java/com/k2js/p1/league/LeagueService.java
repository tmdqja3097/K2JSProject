package com.k2js.p1.league;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.k2js.p1.match.MatchDAO;
import com.k2js.p1.match.MatchVO;

@Service
public class LeagueService {

	@Autowired
	private LeagueDAO leagueDAO;
	@Autowired
	private MatchDAO matchDAO;
	
	
	
	public List<LeagueVO> leagueTeamList() throws Exception{
		return leagueDAO.leagueTeamList();
	}
	
	public LeagueVO leagueSelect(String teamName) throws Exception{
		return leagueDAO.leagueSelect(teamName);
	}
	
	public List<LeagueVO> leagueMaleList(String name) throws Exception{
		//leagueVO.setNum(matchDAO.matchNum());
		return leagueDAO.leagueMaleList(name);
	}
	
	public int leagueWrite(LeagueVO leagueVO) throws Exception{
		return leagueDAO.leagueWrite(leagueVO);
	}
	
	public int leagueDelete(String teamName) throws Exception{
		return leagueDAO.leagueDelete(teamName);
	}
}
