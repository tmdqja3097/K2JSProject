package com.k2js.p1.member;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/member/**")
public class MemberController {

	@Autowired
	private MemberService memberService;

	@GetMapping("MemberLogout")
	public String memberLogout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:../";
	}

	@GetMapping("MemberLogin")
	public String memberLogin() throws Exception {
		return "member/MemberLogin";
	}

	@PostMapping("MemberKakaoLogin")
	public ModelAndView memberKakaoLogin(MemberVO memberVO, String birth1, HttpSession session, ModelAndView mav) throws Exception {
		DateFormat sdf = new SimpleDateFormat("mmdd");
		memberVO.setBirth(sdf.parse(birth1));
		memberVO = memberService.memberKakaoLogin(memberVO);

		if (memberVO != null) {
			//Cookie작업
			session.setAttribute("member", memberVO);
		}
		mav.addObject("result", memberVO);
		mav.setViewName("common/ajaxResult");
		return mav;
	}

	@PostMapping("MemberLogin")
	public String memberLogin(MemberVO memberVO, HttpSession session) throws Exception {
		memberVO = memberService.memberLogin(memberVO);
		if (memberVO != null) {
			//Cookie작업
			session.setAttribute("member", memberVO);
		} else {
			return "redirect:./MemberLogin";
		}
		return "redirect:../";
	}

	@GetMapping("MemberNew")
	public String memberNew() throws Exception {
		return "member/MemberNew";
	}

	@PostMapping("MemberNew")
	public String memberNew(MemberVO memberVO, String birth_year, String birth_month, String birth_day)
			throws Exception {
		String date = birth_year + "/" + birth_month + "/" + birth_day;
		DateFormat sdf = new SimpleDateFormat("yyyy/mm/dd");
		Date birth = (Date) sdf.parse(date);
		memberVO.setBirth(birth);
		int result = memberService.memberNew(memberVO);
		if (result > 0) {
			return "redirect:../";
		}
		return "redirect:./";
	}

	@GetMapping("MemberPage")
	public String memberPage() throws Exception {
		return "member/MemberPage";
	}

	@GetMapping("MemberUpdate")
	public String memberUpdate() throws Exception {
		return "member/MemberUpdate";
	}

	@PostMapping("MemberUpdate")
	public String memberUpdate(MemberVO memberVO, String birth, HttpSession session) throws Exception {
		memberVO.setId(((MemberVO) session.getAttribute("member")).getId());
		System.out.println(birth);
		System.out.println(memberVO.getId());
		int result = memberService.memberUpdate(memberVO);
		if (result > 0) {
			session.setAttribute("member", memberVO);
			return "member/MemberPage";
		}
		return "redirect:./";
	}
	
	@GetMapping("MemberDelete")
	public String memberDelete(HttpSession session) throws Exception {
		System.out.println("MemberDelete");
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		int result = memberService.memberDelete(memberVO);
		if(result >0) {
			session.invalidate();
		}
		return "redirect:../";
	} 

	@GetMapping("MemberAddCash")
	public String memberAddCash() throws Exception {
		return "member/MemberAddCash";
	}

	@GetMapping("CultureCharge")
	public void CultureCharge(Model model, long cash) throws Exception {
	}
	
	@GetMapping("KakaoPayCharge")
	public void KakaoPayCharge(Model model) throws Exception{
		
	}
}
