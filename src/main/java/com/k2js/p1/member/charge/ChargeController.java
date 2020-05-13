package com.k2js.p1.member.charge;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/member/**")
public class ChargeController {
	
	@Autowired
	private ChargeService chargeService;
	
    @PostMapping("KakaoPay")
    public String kakaoPay(HttpSession session, int money) {
        System.out.println("kakaoPay post............................................");
        System.out.println("redirect:" + chargeService.kakaoPayReady(session, money));
        return "redirect:" + chargeService.kakaoPayReady(session, money);
    }
    
//    @GetMapping("Success")
//    public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model,HttpSession session, int money) {
//    	System.out.println("kakaoPaySuccess pg_token : " + pg_token);
//        
//        model.addAttribute("info", chargeService.kakaoPayInfo(pg_token,session, money ));
//        
//    }
	
}
