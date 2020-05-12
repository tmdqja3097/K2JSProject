package com.k2js.p1.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	public MemberVO memberLogin(MemberVO memberVO) throws Exception{
		return memberDAO.memberLogin(memberVO);
	}
	public int memberNew(MemberVO memberVO) throws Exception {
		return memberDAO.memberNew(memberVO);
	}
	public int memberUpdate(MemberVO memberVO) throws Exception{
		return memberDAO.memberUpdate(memberVO);
	}
	public MemberVO memberKakaoLogin(MemberVO memberVO) throws Exception {
		memberVO = memberDAO.memberKakaoLogin(memberVO);
		if (memberVO == null) {
			int result = memberDAO.memberKakaoNew(memberVO);
			System.out.println(result);
			if(result >0 ) {
				memberVO = memberDAO.memberKakaoLogin(memberVO);
				System.out.println(memberVO);
			}
		} 
		return memberVO;
	}
}
