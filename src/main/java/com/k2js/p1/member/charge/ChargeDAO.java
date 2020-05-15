package com.k2js.p1.member.charge;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.k2js.p1.member.MemberVO;

@Repository
public class ChargeDAO {

	private final String NAMESPACE = "com.k2js.p1.member.charge.ChargeDAO.";
	@Autowired
	private SqlSession sqlSession;
	
	public int chargeSuccess(MemberVO memberVO) throws Exception {
		return sqlSession.update(NAMESPACE+"chargeSuccess", memberVO);
	}
}
