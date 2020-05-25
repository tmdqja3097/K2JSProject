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
	
	public List<LeagueVO> leagueMaleList(LeagueVO leagueVO) throws Exception{
		return session.selectList(NAMESPACE+"leagueMaleList", leagueVO);
	}
	
	public List<LeagueVO> leagueFemaleList(String teamName) throws Exception{
		return session.selectList(NAMESPACE+"leagueFemaleList", teamName);
	}
	
	public int leagueMaleWrite(LeagueVO leagueVO) throws Exception{
		return session.insert(NAMESPACE+"leagueMaleWrite", leagueVO);
	}
	
}
