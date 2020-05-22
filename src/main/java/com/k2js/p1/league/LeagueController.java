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
	
	@GetMapping("manCar") 
		public void manCar() {

	}
	
	@GetMapping("womanCar") 
		public void womanCar() {
		
	}
	
	@GetMapping("manRanks") 
		public void manRanks() {
		
	}
	
	@GetMapping("womanRanks") 
		public void womanRanks() {
		
	}
	
	@GetMapping("onedayMan")
		public void onedayMan() {
		
	}
	
	@GetMapping("onedayWoman")
		public void onedayWoman() {
		
	}
}

