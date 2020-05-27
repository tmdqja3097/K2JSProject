package com.k2js.p1.manager.file;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ManagerFileDAO {


	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.k2js.p1.manager.file.ManagerFileDAO.";
	
	
	public ManagerFileVO fileSelect(ManagerFileVO managerFileVO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"fileSelect", managerFileVO);
	}
	
	public int fileInsert(ManagerFileVO managerFileVO)throws Exception{
		return sqlSession.insert(NAMESPACE+"fileInsert", managerFileVO);
	}
	
	public int fileDelete(Long fileNum)throws Exception{
		return sqlSession.delete(NAMESPACE+"fileDelete", fileNum);
	}
}
