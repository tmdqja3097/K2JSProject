package com.k2js.p1.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	private final String NAMESPACE ="com.k2js.p1.member.MemberDAO.";
	@Autowired
	private SqlSession sqlSession;
	
	public MemberVO memberLogin(MemberVO memberVO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"memberLogin", memberVO);
	}
	public int memberNew(MemberVO memberVO) throws Exception {
		return sqlSession.insert(NAMESPACE+"memberNew", memberVO);
	}
}
