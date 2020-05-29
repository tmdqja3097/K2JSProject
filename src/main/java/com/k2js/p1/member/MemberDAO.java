package com.k2js.p1.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.k2js.p1.match.MatchVO;
import com.k2js.p1.matchforcapa.MatchForCapaVO;

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
	
	public int memberUpdate(MemberVO memberVO) throws Exception {
		return sqlSession.update(NAMESPACE+"memberUpdate", memberVO);
	}
	public int memberKakaoNew(MemberVO memberVO) throws Exception {
		return sqlSession.insert(NAMESPACE+"memberKakaoNew", memberVO);
	}
	public MemberVO memberKakaoLogin(MemberVO memberVO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"memberKakaoLogin", memberVO);
	}
	public int memberDelete(MemberVO memberVO) throws Exception {
		return sqlSession.delete(NAMESPACE+"memberDelete", memberVO);
	}
	public int memberKakaoDelete(MemberVO memberVO) throws Exception{
		return sqlSession.delete(NAMESPACE+"memberKakaoDelete", memberVO);
	}
	public int memberFindPwReset(MemberVO memberVO) throws Exception {
		return sqlSession.update(NAMESPACE + "memberFindPwReset", memberVO);
	}
	public MemberVO memberFindPw(MemberVO memberVO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "memberFindPw", memberVO);
	}
	public MemberVO memberFindId(MemberVO memberVO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "memberFindId", memberVO);
	}
	public List<MatchForCapaVO> memberCapaList(MemberVO memberVO) throws Exception {
		return sqlSession.selectList(NAMESPACE + "memberCapaList", memberVO);
	}
	public MatchVO memberLastCapa(MatchForCapaVO mfcVO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "memberLastCapa", mfcVO);
	}
	public MemberVO memberSearch(MemberVO memberVO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"memberSearch", memberVO);
	}
	public MemberVO memberEmailCheck(String emailCk) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"memberEmailCheck", emailCk);
	}
}
 