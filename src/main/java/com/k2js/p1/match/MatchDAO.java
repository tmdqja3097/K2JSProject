package com.k2js.p1.match;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MatchDAO {

	@Autowired
	private SqlSession session;
	private final String NAMESPACE = "com.k2js.p1.match.MatchDAO.";
	
	public List<MatchVO> matchList() throws Exception{
		return session.selectList(NAMESPACE+"matchList");
	}
	
}
