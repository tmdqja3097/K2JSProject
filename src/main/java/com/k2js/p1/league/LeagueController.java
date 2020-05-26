package com.k2js.p1.league;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.k2js.p1.match.MatchService;
import com.k2js.p1.match.MatchVO;
import com.k2js.p1.stadium.StadiumService;
import com.k2js.p1.stadium.StadiumVO;


@Controller
@RequestMapping("/league/**")
public class LeagueController {

	@Autowired
	private LeagueService leagueService;
	@Autowired
	private MatchService matchService;
	
	@GetMapping("leagueView")
	public void leagueMaleList(String teamName, LeagueVO leagueVO, Model model) throws Exception{
		List<LeagueVO> leagues = leagueService.leagueTeamList();
		
		long point = 0;
		long rank = 0;
		
		List<Long> pointList = new ArrayList<Long>();
		
		for(int i=0; i<leagues.size(); i++) {
			leagues.get(i).setPoint(point);
			
			
//			pointList.add(leagueP);
//			for(int j=0; j<leagues.size(); j++) {
//				
//			}
//			
//			Collections.sort(pointList, Collections.reverseOrder());
//			
//			System.out.println("pl:"+pointList.get(i));
			
			
		 	rank = rank+1;
		 	leagues.get(i).setRank(rank);
		}
		
		model.addAttribute("leagues", leagues);
	}
	
	@GetMapping("leagueWrite")
	public void leagueMaleWrite() throws Exception{
		
	}
	
	@PostMapping("leagueWrite")
	public ModelAndView leagueMaleWrite(LeagueVO leagueVO) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		int result = leagueService.leagueWrite(leagueVO);
		System.out.println(result);
		
		if(result > 0) {
			mav.setViewName("redirect:./leagueView");
		}else {
			mav.setViewName("./leagueView");
		}
		return mav;
	}
	
	@GetMapping("leagueSelect")
	public ModelAndView leagueSelect(String teamName) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		LeagueVO leagueVO = leagueService.leagueSelect(teamName);
		
		mav.addObject("leagueVO", leagueVO);
		mav.setViewName("league/leagueSelect");
		
		return mav;
	}
	
	
	@GetMapping("leagueDelete")
	public ModelAndView leagueDelete(String teamName) throws Exception{
		ModelAndView mav = new ModelAndView();
		int result = leagueService.leagueDelete(teamName);
		
		if(result>0) {
			mav.setViewName("redirect:../league/leagueView");
		}
		return mav;
	}
	
}
