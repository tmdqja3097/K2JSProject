package com.k2js.p1.league;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/league/**")
public class LeagueController {

	@GetMapping("leagueView")
		public void leagueView() {
		
	}
	
	@GetMapping("leagueA")
		public void leagueA() {
		
	}
}

