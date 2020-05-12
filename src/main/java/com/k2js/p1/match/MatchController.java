package com.k2js.p1.match;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/")
public class MatchController {

	@Autowired
	private MatchService matchService;
	

	@GetMapping("todayMatchList")
	public ModelAndView todayMatchList() throws Exception{

	
	@GetMapping("matchList")
	public ModelAndView matchList(String matchTime) throws Exception {		

		ModelAndView mv = new ModelAndView();
		//mv.addObject("vo",matchVO);
		mv.setViewName("home");
		return mv;
	}
	
	@GetMapping("getMatch")
	public void matchList(int matchTime, Model model) throws Exception{

		

		List<MatchVO> matchVOs = matchService.matchList(matchTime);
		int i = matchVOs.size();
		
		model.addAttribute("matchs",matchVOs);
		model.addAttribute("i",i);
		

		String [] matchDays = matchTime.split("/");
		String day = matchDays[0];
		
		List<MatchVO> ar = matchService.matchList(day);
		
		//match 개수
		int matchView = ar.size();
		
		int s = 0;
		if(matchView==0) { 
			s = 1;
		}
		System.out.println(matchView);
		
		mv.addObject("no",s);
		mv.addObject("list", ar);
		mv.addObject("matchView", matchView);
		mv.setViewName("./getDayList");
		
		return mv;	
	}//end matchList

	
	}
		
	
	@GetMapping("matchSelect")
	public ModelAndView matchSelect(long num) throws Exception{
		ModelAndView mv = new ModelAndView();
		MatchVO matchVO = matchService.matchSelect(num);
		mv.addObject("vo", matchVO);
		mv.setViewName("match/playSelect");
		
		return mv;
	}
	
	
	
}//end class
