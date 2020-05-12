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
	
	@GetMapping("getMatch")
	public void matchList(int matchTime, Model model) throws Exception{

		List<MatchVO> matchVOs = matchService.matchList(matchTime);
		int i = matchVOs.size();
		
		System.out.println(i);
		model.addAttribute("matchs",matchVOs);
		model.addAttribute("i",i);
	
		
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
