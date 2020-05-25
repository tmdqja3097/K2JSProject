package com.k2js.p1.league;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

@Controller
@RequestMapping("/league/**")
public class LeagueController {

	@Autowired
	private LeagueService leagueService;
	@Autowired
	private MatchService matchService;
	
	@GetMapping("leagueView")
	public void leagueMaleList(String teamName, Model model) throws Exception{
		List<LeagueVO> leagues = leagueService.leagueMaleList(teamName);
		System.out.println(teamName);
		System.out.println(leagues.get(0).getTeamName());
		model.addAttribute("leagues", leagues);
	}
	
	@GetMapping("leagueWrite")
	public void leagueMaleWrite() throws Exception{
		
	}
	
	@PostMapping("leagueWrite")
	public ModelAndView leagueMaleWrite(LeagueVO leagueVO, long num, String day, String time) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		MatchVO matchVO = matchService.matchSelect(num);
		Date date = matchVO.getMatchTime();
		
//		String date = day+time;
//		DateFormat dfm = new SimpleDateFormat("yyyy-MM-ddhh:mm");
//		Date dDate = (Date)dfm.parse(date);	
//		matchVO.setMatchTime(dDate);
		
		leagueVO.setMatchDate(date);
		
		int result = leagueService.leagueMaleWrite(leagueVO);
		System.out.println(result);
		if(result > 0) {
			mav.setViewName("redirect:./leagueView");
		}else {
			mav.setViewName("./leagueView");
		}
		return mav;
	}
}
