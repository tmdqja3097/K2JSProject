package com.k2js.p1.stadium.file;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.k2js.p1.stadium.file.StadiumFileVO;

@Repository
public class StadiumFileDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.k2js.p1.stadium.file.StadiumFileDAO.";
	
	
	public StadiumFileVO fileSelect(StadiumFileVO stadiumFileVO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"fileSelect", stadiumFileVO);
	}
	
	public int fileInsert(StadiumFileVO stadiumFileVO)throws Exception{
		return sqlSession.insert(NAMESPACE+"fileInsert", stadiumFileVO);
	}
	
	public int fileDelete(Long fileNum)throws Exception{
		return sqlSession.delete(NAMESPACE+"fileDelete", fileNum);
	}
}
