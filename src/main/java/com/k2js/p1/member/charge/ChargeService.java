package com.k2js.p1.member.charge;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.k2js.p1.member.MemberVO;

@Service
public class ChargeService {
	private static final String HOST = "https://kapi.kakao.com";

	@Autowired
	private KakaoPayReadyVO kakaoPayReadyVO;
	@Autowired
	private KakaoPayApprovalVO kakaoPayApprovalVO;
	@Autowired
	private ChargeDAO chargeDAO;

	public List<ChargeVO> chargeList(MemberVO memberVO) throws Exception {
		return chargeDAO.chargeList(memberVO);
	}

	public String kakaoPayReady(HttpSession session, int money) {
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		RestTemplate restTemplate = new RestTemplate();
		System.out.println("connect");

		// 서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK" + " 9cd9eafac1eac29eb3a3a8e894c16f31");
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		headers.add("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");

		// 서버로 요청할 Body
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
		params.add("partner_order_id", "K2JS");
		params.add("partner_user_id", memberVO.getName());
		params.add("item_name", "cash");
		params.add("quantity", "1");
		params.add("total_amount", "" + money);
		params.add("tax_free_amount", "100");
		params.add("approval_url", "http://localhost:8080/p1/member/charge/Success?money=" + money);
		params.add("cancel_url", "http://localhost:8080/p1/member/charge/Cancel");
		params.add("fail_url", "http://localhost:8080/p1/member/charge/Fail");
		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
		try {
			String rTl = restTemplate.postForObject(HOST + "/v1/payment/ready", body, String.class);
			ObjectMapper mapper = new ObjectMapper();
			kakaoPayReadyVO = mapper.readValue(rTl, KakaoPayReadyVO.class);
			return kakaoPayReadyVO.getNext_redirect_pc_url();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "member/MemberAddCash";

	}

	public KakaoPayApprovalVO kakaoPayInfo(String pg_token, HttpSession session, int money) {

		RestTemplate restTemplate = new RestTemplate();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");

		// 서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK" + " 9cd9eafac1eac29eb3a3a8e894c16f31");
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		headers.add("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");

		// 서버로 요청할 Body
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
		params.add("tid", kakaoPayReadyVO.getTid());
		params.add("partner_order_id", "K2JS");
		params.add("partner_user_id", memberVO.getName());
		params.add("pg_token", pg_token);
		params.add("total_amount", "" + money);

		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

		try {
			String rTl = restTemplate.postForObject(HOST + "/v1/payment/approve", body, String.class);
			ObjectMapper mapper = new ObjectMapper();
			kakaoPayApprovalVO = mapper.readValue(rTl, KakaoPayApprovalVO.class);
			if (kakaoPayApprovalVO.getApproved_at() != null) {
				Date date = new Date();
				kakaoPayApprovalVO.setApproved_at(date);
				int cash = memberVO.getCash();
				memberVO.setCash(cash + money);
				if (memberVO.getLoginmt() == 1) {
					chargeDAO.chargeSuccess(memberVO);
				} else if (memberVO.getLoginmt() == 0) {
					chargeDAO.chargeSuccess2(memberVO);
				}
				ChargeVO chargeVO = new ChargeVO();
				chargeVO.setUserId(memberVO.getId());
				chargeVO.setChargeMethod(1);
				chargeVO.setAmount(money);
				chargeDAO.chargeResult(chargeVO);
			}
			return kakaoPayApprovalVO;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

}
