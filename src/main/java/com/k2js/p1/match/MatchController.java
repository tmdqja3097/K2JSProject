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

import com.k2js.p1.stadium.StadiumService;
import com.k2js.p1.stadium.StadiumVO;


@Controller
@RequestMapping("/")
public class MatchController {

	@Autowired
	private MatchService matchService;
	@Autowired
	private StadiumService stadiumService;
	
	@GetMapping("getMatch")
	public void matchList(int matchTime, Model model) throws Exception{

		List<MatchVO> matchVOs = matchService.matchList(matchTime);
		int i = matchVOs.size();
		

		System.out.println(i);

		model.addAttribute("matchs",matchVOs);
		model.addAttribute("i",i);
		
	}
		
	
	@GetMapping("/match/matchSelect")
	public ModelAndView matchSelect(long num) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		MatchVO matchVO = matchService.matchSelect(num);
		String fullTime = matchService.matchSelect(num).getFullTime();
		
		  String title = matchVO.getTitle(); 
	
			
		  StadiumVO stadiumVO = stadiumService.stadiumSelect(title);
		 System.out.println(stadiumVO.getName());
		 System.out.println(stadiumVO.getAddress());

		mv.addObject("fullTime",fullTime);
		mv.addObject("stadiumVO",stadiumVO); 
		mv.addObject("matchVO",matchVO);
		mv.setViewName("match/matchSelect");
	
		return mv;
	}
	

	
	
	
	
}//end class
