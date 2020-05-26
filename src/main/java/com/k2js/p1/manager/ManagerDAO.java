package com.k2js.p1.manager;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ManagerDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE="com.k2js.p1.manager.ManagerDAO.";

	public long managerNum() throws Exception{
		return sqlSession.selectOne(NAMESPACE+"managerNum");
	}
	

	public int addManager(ManagerVO managerVO) throws Exception {
		return sqlSession.insert(NAMESPACE+"addManager", managerVO);		
	}
}
