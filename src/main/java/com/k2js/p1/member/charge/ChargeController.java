package com.k2js.p1.member.charge;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.k2js.p1.member.MemberVO;

@Controller
@RequestMapping("/member/**")
public class ChargeController {

	@Autowired
	private ChargeService chargeService;

	@GetMapping("KakaoPay")
	public String kakaoPay(HttpSession session, int money, ModelAndView mav) {
		HttpURLConnection conn;
		try {
			URL url = new URL(chargeService.kakaoPayReady(session, money));
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setDoInput(true);
			conn.setDoOutput(true);
			conn.setConnectTimeout(60);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:" + chargeService.kakaoPayReady(session, money);
	}

	@GetMapping("Success")
	public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model, HttpSession session,
			int money) {
		KakaoPayApprovalVO kkpaVO = new KakaoPayApprovalVO();
		kkpaVO = chargeService.kakaoPayInfo(pg_token, session, money);
		if(kkpaVO != null) {
		}
		model.addAttribute("info", kkpaVO);
	}
	
	@GetMapping("MemberChargeList")
	public String memberChargeList(HttpSession session, Model model) throws Exception {
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		List<ChargeVO> ar = chargeService.chargeList(memberVO);
		model.addAttribute("chargeList",ar);
		return "member/MemberChargeList";
	}

}
