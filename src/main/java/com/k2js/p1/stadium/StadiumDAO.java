package com.k2js.p1.stadium;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class StadiumDAO {
	@Autowired
	private SqlSession session;
	private final String NAMESPACE = "com.k2js.p1.stadium.StadiumDAO.";
	
	public StadiumVO stadiumSelect(String stadiumName) throws Exception{
		System.out.println(11);
		return session.selectOne(NAMESPACE+"stadiumSelect", stadiumName);
	}
	
	public int addStadium(StadiumVO stadiumVO)throws Exception{
		return session.insert(NAMESPACE+"addStadium",stadiumVO);
	}
	
	public List<StadiumVO> stadiumList()throws Exception{
		return session.selectList(NAMESPACE+"stadiumList");
	}
	public List<StadiumVO> stadiumList(String stadiumName) throws Exception{
		return session.selectList(NAMESPACE+"stadiumSelectList", stadiumName);
	}
}
