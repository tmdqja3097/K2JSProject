package com.k2js.p1.league;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/league/**")
public class LeagueController {

	@Autowired
	private LeagueService leagueService;

	@GetMapping("leagueA")
	public String leagueA() throws Exception{
		return "league/leagueA";
	}

	@GetMapping("manCar")
	public String manCar() throws Exception {
		return "league/manCar";
	}

	@GetMapping("womanCar")
	public String womanCar() throws Exception {
		return "league/womanCar";
	}

	@GetMapping("manRanks")
	public String manRanks() throws Exception {
		return "league/manRanks";
	}

	@GetMapping("womanRanks")
	public String womanRanks() throws Exception {
		return "league/womanRanks";
	}

	@GetMapping("onedayMan")
	public String onedayMan() throws Exception {
		return "league/onedayMan";
	}

	@GetMapping("onedayWoman")
	public String onedayWoman() throws Exception {
		return "league/onedayWoman";
	}


	@GetMapping("leagueGender")
	public ModelAndView leagueGender(int gender)throws Exception{
		ModelAndView mav = new ModelAndView();
		List<LeagueVO> leaguesG = leagueService.leagueTeamGenderList(gender);
		
		for(int i=0; i<leaguesG.size(); i++) {
			double win = (double)leaguesG.get(i).getWin();
		 	double lose = (double)leaguesG.get(i).getLose();
		 	
		 	double rate = win/(win+lose)*100;
		 	leaguesG.get(i).setWinRate(Math.round(rate));
		}
		
		mav.addObject("leagues", leaguesG);
		mav.setViewName("league/leagueView");
		return mav;
	}

	@GetMapping("leagueView")
	public void leagueTeamList(String teamName, LeagueVO leagueVO, Model model) throws Exception{
		List<LeagueVO> leagues = leagueService.leagueTeamList();
		
		long point = 0;
		
		for(int i=0; i<leagues.size(); i++) {
			leagues.get(i).setPoint(point);
			
			leagues.get(i).getPoint();
		 	
		 	double win = (double)leagues.get(i).getWin();
		 	double lose = (double)leagues.get(i).getLose();
		 	
		 	double rate = win/(win+lose)*100;
		 	leagues.get(i).setWinRate(Math.round(rate));
		}
		model.addAttribute("leagues", leagues);
	}

	@GetMapping("leagueWrite")
	public void leagueWrite() throws Exception{
		
	}

	@PostMapping("leagueWrite")
	public ModelAndView leagueWrite(LeagueVO leagueVO) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		int result = leagueService.leagueWrite(leagueVO);
		
		if(result > 0) {
			mav.setViewName("redirect:./leagueView");
		}else {
			mav.setViewName("redirect:./leagueView");
		}
		return mav;
	}

	@GetMapping("leagueSelect")
	public ModelAndView leagueSelect(String teamName) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		/* List<LeagueVO> leagues = leagueService.leagueTeamList(); */
		List<LeagueVO> leagues = leagueService.leagueTeamList();
		
		LeagueVO leagueVO = leagueService.leagueSelect(teamName);
		long rank=0;
		/*
		 * for(int i=0; i<leagues.size(); i++) { rank=+1; System.out.println(rank);
		 * leagueVO.setRank(rank); }
		 */
		mav.addObject("leagueVO", leagueVO);
		mav.addObject("leagues", leagues);
		mav.setViewName("league/leagueSelect");
		
		return mav;
	}

	@GetMapping("leagueUpdate")
	public String leagueUpdate(String teamName, Model model) throws Exception{
		
		LeagueVO leagueVO = leagueService.leagueSelect(teamName);
		
		model.addAttribute("leaVO", leagueVO);
		
		return "league/leagueUpdate";
	}

	@PostMapping("leagueUpdate")
	public ModelAndView leagueUpdate(LeagueVO leagueVO) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		int result = leagueService.leagueUpdate(leagueVO);
		if(result>0) {
			mav.setViewName("redirect:./leagueView");
		}else {
			mav.setViewName("redirect:./leagueView");
		}
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
