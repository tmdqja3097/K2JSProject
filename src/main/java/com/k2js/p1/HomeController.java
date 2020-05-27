package com.k2js.p1;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.k2js.p1.member.MemberVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	/**
	 * Simply selects the home view to render by returning its name.
	 */ 
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) {
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		model.addAttribute("member", memberVO);
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	@RequestMapping("popUp")
	public String popUp() throws Exception {
		return "popUp";
	}
	@RequestMapping("term")
	public String term() throws Exception{
		return "term";
	}
	@RequestMapping("privacy")
	public String privacy() throws Exception {
		return "privacy";
	}
	
}
