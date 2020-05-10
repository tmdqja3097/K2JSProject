package com.k2js.p1.match;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MatchDAO {

	@Autowired
	private SqlSession session;
	private final String NAMESPACE = "com.k2js.p1.match.MatchDAO.";
	
	//경기날짜
	public Date matchDate(MatchVO matchVO) throws Exception{
		return session.selectOne(NAMESPACE+"matchDate", matchVO);
	}
	
	public List<MatchVO> matchList(Date date) throws Exception{
		return session.selectList(NAMESPACE+"matchList", date);
	}
	
	public MatchVO matchSelect(long num) throws Exception{
		return session.selectOne(NAMESPACE+"matchSelect", num);
	}
	
}
