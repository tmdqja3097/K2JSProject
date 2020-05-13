package com.k2js.p1.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		if (memberVO.getPhone() == null) {
			memberVO.setPhone("000-0000-0000");
		}
		System.out.println("memberKakaoLogin");
		MemberVO mVO = memberDAO.memberKakaoLogin(memberVO);
		
		if (mVO == null) {
			int result = memberDAO.memberKakaoNew(memberVO);

			if (result > 0) {
				mVO = memberDAO.memberKakaoLogin(memberVO);
			}
		}

		return mVO;
	}
}
