package com.k2js.p1.stadium;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/stadium/**")
public class StadiumController {

	@Autowired
	private StadiumService stadiumService;
	
	@GetMapping("addStadium")
	public void addStadium()throws Exception{
		
	}
	@PostMapping("addStadium")
	public ModelAndView addStadium(StadiumVO stadiumVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = stadiumService.addStadium(stadiumVO);
		if (result > 0) {
			mv.setViewName("redirect:../");
		}
		return mv;
		
	}
}
