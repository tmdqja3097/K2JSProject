package com.k2js.p1.league;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LeagueDAO {

	@Autowired
	private SqlSession session;
	private final String NAMESPACE = "com.k2js.p1.league.LeagueDAO.";
	
	public List<LeagueVO> leagueTeamList() throws Exception{
		return session.selectList(NAMESPACE+"leagueTeamList");
	}
	
	public List<LeagueVO> leagueTeamGenderList(int gender) throws Exception{
		return session.selectList(NAMESPACE+"leagueTeamGenderList", gender);
	}
	
	
	public LeagueVO leagueSelect(String teamName) throws Exception{
		return session.selectOne(NAMESPACE+"leagueSelect", teamName);
	}
	
	public int leagueDelete(String teamName) throws Exception{
		return session.delete(NAMESPACE+"leagueDelete", teamName);
	}
	
	public int leagueWrite(LeagueVO leagueVO) throws Exception{
		return session.insert(NAMESPACE+"leagueWrite", leagueVO);
	}
	
	public int leagueUpdate(LeagueVO leagueVO) throws Exception{
		return session.update(NAMESPACE+"leagueUpdate", leagueVO);
	}
	
	public LeagueVO leagueTeamCheck(LeagueVO leagueVO) throws Exception{
		return session.selectOne(NAMESPACE+"leagueTeamCheck", leagueVO);
	}
	
	public List<LeagueVO> leagueTotalList() throws Exception{
		return session.selectList(NAMESPACE+"leagueTotalList");
	}
	
}
