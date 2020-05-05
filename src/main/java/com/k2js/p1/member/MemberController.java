package com.k2js.p1.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/member/**")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("MemberLogin")
	public String memberLogin() throws Exception{
		return "member/MemberLogin";
	}
	
	@PostMapping("MemberLogin")
	public String memberLogin(MemberVO memberVO, HttpSession session) throws Exception{
		System.out.println(memberVO.getUserId());
		System.out.println(memberVO.getUserPassword());
		memberVO = memberService.memberLogin(memberVO);
		if (memberVO != null) {
		session.setAttribute("member", memberVO);
		} else { 
			return "redirect:./";
		}
		return "redirect:../"; 
	}
	
	@GetMapping("MemberNew")
	public String memberNew() throws Exception{
		return "member/MemberNew";
	}
	
	@PostMapping("MemberNew")
	public String memberNew(MemberVO memberVO) throws Exception{
		int result = memberService.memberNew(memberVO);
		if(result >0) {
			return "redirect:../";
		}
		return "redirect:./";
	}

}
