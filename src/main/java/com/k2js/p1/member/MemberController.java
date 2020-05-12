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
import org.springframework.web.bind.annotation.RequestParam;
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
	public String memberKakaoLogin(MemberVO memberVO, HttpSession session) throws Exception {
		System.out.println("MemberKakaoLogin");
		String path = "";
		System.out.println(memberVO);
		/*
		 * if(memberVO == null) { path = "redirect:./MemberLogin"; } else { memberVO =
		 * memberService.memberKakaoLogin(memberVO); session.setAttribute("member",
		 * memberVO); path = "redirect:../"; }
		 */
		return path;

	}

	@PostMapping("MemberLogin")
	public String memberLogin(MemberVO memberVO, HttpSession session) throws Exception {
		memberVO = memberService.memberLogin(memberVO);
		if (memberVO != null) {
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
		System.out.println(date);
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
	public String memberUpdate(MemberVO memberVO, HttpSession session) throws Exception {
		memberVO.setId(((MemberVO) session.getAttribute("member")).getId());
		System.out.println(memberVO.getId());
		int result = memberService.memberUpdate(memberVO);
		if (result > 0) {
			session.setAttribute("member", memberVO);
			return "member/MemberPage";
		}
		return "redirect:./";
	}

	@GetMapping("MemberAddCash")
	public String memberAddCash() throws Exception {
		return "member/MemberAddCash";
	}

	@PostMapping("MemberAddCash")
	public void memberAddCash(MemberVO memberVO) throws Exception {

	}

	@GetMapping("CultureCharge")
	public void CultureCharge(Model model, long cash) throws Exception {
	}

}
