package com.k2js.p1.board.file;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.k2js.p1.board.file.BoardFileVO;

@Repository
public class BoardFileDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.k2js.p1.board.file.BoardFileDAO.";
	
	
	public BoardFileVO fileSelect(BoardFileVO boardFileVO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"fileSelect", boardFileVO);
	}
	
	public int fileInsert(BoardFileVO boardFileVO)throws Exception{
		return sqlSession.insert(NAMESPACE+"fileInsert", boardFileVO);
	}
	
	public int fileDelete(Long fileNum)throws Exception{
		return sqlSession.delete(NAMESPACE+"fileDelete", fileNum);
	}
}
