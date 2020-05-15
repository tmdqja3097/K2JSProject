package com.k2js.p1.member.charge;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;

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
public class ChargeController {

	@Autowired
	private ChargeService chargeService;

	@GetMapping("KakaoPay")
	public String kakaoPay(HttpSession session, int money, ModelAndView mav) {
		System.out.println("kakaoPay post............................................");
		HttpURLConnection conn;
		BufferedReader buff = null;
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
}
