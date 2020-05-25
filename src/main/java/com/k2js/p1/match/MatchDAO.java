package com.k2js.p1.match;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.k2js.p1.matchforcapa.MatchForCapaVO;
import com.k2js.p1.member.MemberVO;

@Repository
public class MatchDAO {

	@Autowired
	private SqlSession session;
	private final String NAMESPACE = "com.k2js.p1.match.MatchDAO.";

	public int matchJoin(MatchVO matchVO) {
		return session.update(NAMESPACE + "matchCount", matchVO);
	}

	public int matchForCapa(MatchForCapaVO mfcVO) {
		return session.insert(NAMESPACE + "matchForCapa", mfcVO);
	}

	public int discountMemberCash(MemberVO memberVO) {
		return session.update(NAMESPACE + "discountMemberCash", memberVO);
	}

	public int matchDelete(long num) throws Exception {
		return session.delete(NAMESPACE + "matchDelete", num);
	}

	public List<MatchVO> matchList(int day) throws Exception {
		return session.selectList(NAMESPACE + "matchList", day);
	}

	public MatchVO matchSelect(long num) throws Exception {
		return session.selectOne(NAMESPACE + "matchSelect", num);
	}

	public int matchWrite(MatchVO matchVO) throws Exception {
		return session.insert(NAMESPACE + "matchWrite", matchVO);
	}

	public long matchNum() throws Exception {
		return session.selectOne(NAMESPACE + "matchNum");
	}

	public int matchUpdate(MatchVO matchVO) throws Exception {
		return session.update(NAMESPACE + "matchUpdate", matchVO);
	}
	public MatchForCapaVO matchCancel(MatchForCapaVO mfcVO) throws Exception {
		return session.selectOne(NAMESPACE + "matchCancel", mfcVO);
	}
	public int matchCancel2(MatchForCapaVO mfcVO) throws Exception {
		return session.delete(NAMESPACE + "matchCancel2", mfcVO);
	}
}
