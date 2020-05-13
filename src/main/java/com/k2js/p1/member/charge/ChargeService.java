package com.k2js.p1.member.charge;

import java.net.URI;
import java.net.URISyntaxException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.k2js.p1.member.MemberVO;

@Service
public class ChargeService {
	private static final String HOST = "https://kapi.kakao.com";

	@Autowired
	private KakaoPayReadyVO kakaoPayReadyVO;
	@Autowired
	private KakaoPayApprovalVO kakaoPayApprovalVO;

	public String kakaoPayReady(HttpSession session, int money) {
		System.out.println("connect");
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		RestTemplate restTemplate = new RestTemplate();

		// 서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK" + " 9cd9eafac1eac29eb3a3a8e894c16f31");
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		headers.add("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");

		System.out.println(headers);
		System.out.println("admin키 입력 완료");

		// 서버로 요청할 Body
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
		params.add("partner_order_id", "K2JS");
		params.add("partner_user_id", memberVO.getName());
		params.add("item_name", "cash");
		params.add("quantity", "1");
		params.add("total_amount", "" + money);
		params.add("tax_free_amount", "100");
		params.add("approval_url", "./charge/Success");
		params.add("cancel_url", "./charge/Cancel");
		params.add("fail_url", "./charge/Fail");
		System.out.println("add success");
		System.out.println("params:" + params);

		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
		System.out.println("body:" + body);
		try {
			System.out.println(restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body,
					KakaoPayReadyVO.class));
			kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body,
					KakaoPayReadyVO.class);
			System.out.println("" + kakaoPayReadyVO);
			return kakaoPayReadyVO.getNext_redirect_pc_url();

		} catch (RestClientException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "/pay";

	}

//	public KakaoPayApprovalVO kakaoPayInfo(String pg_token, HttpSession session,int money) {
//
//		RestTemplate restTemplate = new RestTemplate();
//		MemberVO memberVO = (MemberVO)session.getAttribute("member"); 
//
//		// 서버로 요청할 Header
//		HttpHeaders headers = new HttpHeaders();
//		headers.add("Authorization", "KakaoAK " + "admin key를 넣어주세요~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!");
//		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
//		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
//
//		// 서버로 요청할 Body
//		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
//		params.add("cid", "TC0ONETIME");
//		params.add("tid", kakaoPayReadyVO.getTid());
//		params.add("partner_order_id", "K2JS");
//		params.add("partner_user_id", memberVO.getName());
//		params.add("pg_token", pg_token);
//		params.add("total_amount", ""+money);
//
//		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
//
//		try {
//			kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body,
//					KakaoPayApprovalVO.class);
//			System.out.println("" + kakaoPayApprovalVO);
//
//			return kakaoPayApprovalVO;
//
//		} catch (RestClientException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (URISyntaxException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//
//		return null;
//	}

}
