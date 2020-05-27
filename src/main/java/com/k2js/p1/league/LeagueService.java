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
	
	
	public List<LeagueVO> leagueTeamList() throws Exception{
		return leagueDAO.leagueTeamList();
	}
	
	public List<LeagueVO> leagueTeamGenderList(int gender) throws Exception{
		return leagueDAO.leagueTeamGenderList(gender);
	}
	
	public LeagueVO leagueSelect(String teamName) throws Exception{
		return leagueDAO.leagueSelect(teamName);
	}
	
	public int leagueWrite(LeagueVO leagueVO) throws Exception{
		leagueVO.setPoint((leagueVO.getWin()*3+leagueVO.getDraw())); 
		return leagueDAO.leagueWrite(leagueVO);
	}
	
	public int leagueDelete(String teamName) throws Exception{
		return leagueDAO.leagueDelete(teamName);
	}
	
	public int leagueUpdate(LeagueVO leagueVO) throws Exception{
		leagueVO.setPoint((leagueVO.getWin()*3+leagueVO.getDraw()));
		return leagueDAO.leagueUpdate(leagueVO);
	}
}
