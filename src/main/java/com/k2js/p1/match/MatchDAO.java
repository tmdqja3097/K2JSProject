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
	
	public int matchDelete(long num)throws Exception{
		return session.delete(NAMESPACE+"matchDelete",num);
	}
	public List<MatchVO> matchList(int day) throws Exception{
		return session.selectList(NAMESPACE+"matchList", day);
	}
	
	public MatchVO matchSelect(long num) throws Exception{
		return session.selectOne(NAMESPACE+"matchSelect", num);
	}
	
	public int matchWrite(MatchVO matchVO) throws Exception{
		return session.insert(NAMESPACE+"matchWrite", matchVO);
	}
	
	public long matchNum() throws Exception{
		return session.selectOne(NAMESPACE+"matchNum");
	}
	
	
}
