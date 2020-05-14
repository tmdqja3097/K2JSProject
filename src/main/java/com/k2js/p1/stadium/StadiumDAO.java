package com.k2js.p1.stadium;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class StadiumDAO {
	@Autowired
	private SqlSession session;
	private final String NAMESPACE = "com.k2js.p1.stadium.StadiumDAO.";
	
	public StadiumVO stadiumSelect(String title) throws Exception{
		return session.selectOne(NAMESPACE+"stadiumSelect", title);
	}
}
