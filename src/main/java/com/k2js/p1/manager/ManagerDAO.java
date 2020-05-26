package com.k2js.p1.manager;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.k2js.p1.board.BoardVO;
import com.k2js.p1.util.Pager;


@Repository
public class ManagerDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE="com.k2js.p1.manager.ManagerDAO.";
	
	public int managerDelete(long number)throws Exception{
		return sqlSession.delete(NAMESPACE+"managerDelete",number);
	}
	
	public long managerNum() throws Exception{
		return sqlSession.selectOne(NAMESPACE+"managerNum");
	}
	
	public int addManager(ManagerVO managerVO) throws Exception {
		return sqlSession.insert(NAMESPACE+"addManager", managerVO);		
	}
	
	public ManagerVO managerSelect(long num)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"managerSelect",num);
	}
	
	public long managerCount(Pager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"managerCount", pager);
	}
	
	public List<ManagerVO> managerList(Pager pager) throws Exception {
		return sqlSession.selectList(NAMESPACE+"managerList", pager);
	}
	

}
