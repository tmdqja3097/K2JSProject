package com.k2js.p1.member;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.k2js.p1.match.MatchVO;
import com.k2js.p1.matchforcapa.MatchForCapaVO;

@Service
public class MemberService {

	@Autowired
	private MemberDAO memberDAO;

	public MemberVO memberLogin(MemberVO memberVO) throws Exception {
		return memberDAO.memberLogin(memberVO);
	}

	public int memberNew(MemberVO memberVO) throws Exception {
		return memberDAO.memberNew(memberVO);
	}

	public int memberUpdate(MemberVO memberVO) throws Exception {
		return memberDAO.memberUpdate(memberVO);
	}

	public MemberVO memberKakaoLogin(MemberVO memberVO) throws Exception {
		return memberDAO.memberKakaoLogin(memberVO);
	}

	public int memberKakaoNew(MemberVO memberVO) throws Exception {
		return memberDAO.memberKakaoNew(memberVO);
	}

	public int memberDelete(MemberVO memberVO) throws Exception {
		if (memberVO.getLoginmt() == 1) {
			return memberDAO.memberKakaoDelete(memberVO);
		} else {
			return memberDAO.memberDelete(memberVO);
		}
	}

	public MemberVO memberFindId(MemberVO memberVO) throws Exception {
		return memberDAO.memberFindId(memberVO);
	}

	public MemberVO memberFindPw(MemberVO memberVO) throws Exception {
		memberVO = memberDAO.memberFindPw(memberVO);
		if (memberVO != null) {
			Calendar cal = Calendar.getInstance();
			String temPw = "" + cal.getTimeInMillis();
			memberVO.setPw(temPw);
			memberDAO.memberFindPwReset(memberVO);
		}
		return memberVO;
	}

	public List<MatchVO> memberCapaList(MemberVO memberVO) throws Exception {
		List<MatchVO> lastList = new ArrayList<MatchVO>();
		List<MatchForCapaVO> ar = memberDAO.memberCapaList(memberVO);
		if (ar.size() != 0) {
			for (MatchForCapaVO list : ar) {
				lastList.add(memberDAO.memberLastCapa(list));
			}
		}
		return lastList;
	}
	public MemberVO memberSearch(MemberVO memberVO) throws Exception {
		return memberDAO.memberSearch(memberVO);
	}
}
