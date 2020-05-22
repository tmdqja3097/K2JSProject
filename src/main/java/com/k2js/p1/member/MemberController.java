package com.k2js.p1.member;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.k2js.p1.match.MatchVO;

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

	@GetMapping("MemberNewKakao")
	public String memberNewKakao() throws Exception {
		return "member/MemberNewKakao";
	}

	@PostMapping("MemberNewKakao")
	public ModelAndView memberNewKakao(MemberVO memberVO, String birth_year, String birth_month, String birth_day,
			HttpSession session, ModelAndView mav) throws Exception {
		MemberVO memberVO2 = (MemberVO) session.getAttribute("member");
		String date = birth_year + "/" + birth_month + "/" + birth_day;
		DateFormat sdf = new SimpleDateFormat("yyyy/mm/dd");
		Date birth = (Date) sdf.parse(date);
		memberVO.setBirth(birth);
		memberVO.setId(memberVO2.getId());
		memberVO.setName(memberVO2.getName());
		memberVO.setGender(memberVO2.getGender());
		session.invalidate();
		int result = memberService.memberKakaoNew(memberVO);
		if (result > 0) {
			mav.setViewName("member/MemberLogin");
		} else {
			mav.setViewName("./");
		}
		return mav;
	}

	@PostMapping("MemberKakaoLogin")
	public ModelAndView memberKakaoLogin(MemberVO memberVO, HttpSession session, ModelAndView mav) throws Exception {
		session.setAttribute("member", memberVO);
		memberVO = memberService.memberKakaoLogin(memberVO);
		mav.addObject("result", "newMember");
		// Cookie작업
		if (memberVO != null) {
			mav.addObject("result", memberVO);
			session.setAttribute("member", memberVO);
		}
		mav.setViewName("common/ajaxResult");
		return mav;
	}

	@GetMapping("MemberLogin")
	public String memberLogin(@CookieValue(value = "cId", required = false) String cId, Model model,
			HttpSession session, HttpServletRequest request) throws Exception {
		model.addAttribute("cId", cId);
		String Referer = request.getHeader("Referer");
		session.setAttribute("Referer", Referer);
		return "member/MemberLogin";
	}

	@PostMapping("MemberLogin")
	public String memberLogin(MemberVO memberVO, HttpSession session, String chbox, HttpServletResponse response,
			String Referer) throws Exception {
		Cookie cookie = new Cookie("cId", "");
		if (chbox != null) {
			cookie.setValue(memberVO.getId());
		}
		response.addCookie(cookie);
		memberVO = memberService.memberLogin(memberVO);
		if (memberVO != null) {
			// Cookie작업
			session.setAttribute("member", memberVO);

		} else {
			return "redirect:./MemberLogin";
		}
		return "redirect:" + Referer;
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
			return "member/MemberLogin";
		}
		return "redirect:./";
	}

	@GetMapping("MemberPage")
	public String memberPage(HttpServletRequest request) throws Exception {
		return "member/MemberPage";
	}

	@GetMapping("MemberUpdate")
	public String memberUpdate() throws Exception {
		return "member/MemberUpdate";
	}

	@PostMapping("MemberUpdate")
	public String memberUpdate(MemberVO memberVO, String birth, HttpSession session) throws Exception {
		memberVO.setId(((MemberVO) session.getAttribute("member")).getId());
		int result = memberService.memberUpdate(memberVO);
		if (result > 0) {
			session.setAttribute("member", memberVO);
			return "member/MemberPage";
		}
		return "redirect:./";
	}

	@GetMapping("MemberDelete")
	public String memberDelete(HttpSession session) throws Exception {
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		int result = memberService.memberDelete(memberVO);
		if (result > 0) {
			session.invalidate();
		}
		return "redirect:../";
	}

	@GetMapping("MemberAddCash")
	public String memberAddCash(@RequestParam(defaultValue = "0") int remainCash, Model model) throws Exception {
		model.addAttribute("remainCash", remainCash);
		return "member/MemberAddCash";
	}

	@GetMapping("CultureCharge")
	public void CultureCharge(Model model, long cash) throws Exception {
	}

	@GetMapping("KakaoPayCharge")
	public void KakaoPayCharge(Model model) throws Exception {
	}

	@GetMapping("MemberFindId")
	public void MemberFindId(Model model) throws Exception {
	}

	@PostMapping("MemberFindId")
	public ModelAndView MemberFindId(MemberVO memberVO, ModelAndView mav) throws Exception {
		memberVO = memberService.memberFindId(memberVO);
		if (memberVO != null) {
			mav.addObject("result", memberVO.getId());
		} else {
			mav.addObject("result", memberVO);
		}
		mav.setViewName("common/ajaxResult");
		return mav;
	}

	@GetMapping("MemberFindPw")
	public void MemberFindPw(Model model) throws Exception {
	}

	@PostMapping("MemberFindPw")
	public ModelAndView MemberFindPw(MemberVO memberVO, ModelAndView mav) throws Exception {
		memberVO = memberService.memberFindPw(memberVO);
		if (memberVO != null) {
			mav.addObject("result", memberVO.getPw());
		} else {
			mav.addObject("result", memberVO);
		}
		mav.setViewName("common/ajaxResult");
		return mav;
	}

	@GetMapping("getCapaList")
	public void getCapaList(Model model, HttpSession session) throws Exception {
		int size = 0;
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		List<MatchVO> ar = memberService.memberCapaList(memberVO);
		String time[] = new String[ar.size()];
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/hh/mm/a");
		if(ar.size() != 0 ) {
			size = ar.size();
			for(int i = 0 ; i < ar.size(); i++) {
				time[i] = sdf.format(ar.get(i).getMatchTime());
				ar.get(i).setRealTime(time[i]);
			}
		}
		model.addAttribute("i", size);
		model.addAttribute("list",ar);
	}
}
