package com.k2js.p1.match;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
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
	public void matchList(int matchTime, Model model) throws Exception {

		List<MatchVO> matchVOs = matchService.matchList(matchTime);
		//System.out.println(matchVOs.toString());
		//System.out.println(matchVOs.get(0).getNum());
		int i = matchVOs.size();
		
		//System.out.println(i);
		//System.out.println("--");
		
		for (int j = 0; j < i; j++) {
			//System.out.println(j);
			String stadiumName = matchVOs.get(j).getStadiumName();
			StadiumVO stadiumVO = stadiumService.stadiumSelect(stadiumName);
			
			String [] s = new String[i];
			s[j] = stadiumVO.getAddress();
			
			
		 	//System.out.println(s[j]);
	
			model.addAttribute("s", s[j]);
			//System.out.println(stadiumVO.getAddress());
		}
		
		
		
		model.addAttribute("matchs", matchVOs);
		model.addAttribute("i", i);

	}
	
	
	@ResponseBody
	@PostMapping("getMatch")
	public void matchList1(@RequestParam(value="addressList[]") List<String> addressList, int day, Model model) throws Exception{
		System.out.println(day);
		System.out.println(addressList);
		List<MatchVO> matchVOs = matchService.matchList(day);
		int ms = matchVOs.size();
		List<MatchVO> matchVOs1 = new ArrayList<MatchVO>();
		
		for(int i=0; i<ms; i++) {
			MatchVO matchVO = new MatchVO();
			String stadiumName = matchVOs.get(0).getStadiumName();
			matchVO=matchService.matchAddrList(day, stadiumName);
			matchVOs1.add(matchVO);
		}
		model.addAttribute("matchs",matchVOs1);
		
		
	}
	
	

	@GetMapping("/match/matchSelect")
	public ModelAndView matchSelect(long num) throws Exception {
		ModelAndView mv = new ModelAndView();

		MatchVO matchVO = matchService.matchSelect(num);
		String fullTime = matchService.matchSelect(num).getFullTime();

		String stadiumName = matchVO.getStadiumName();
		StadiumVO stadiumVO = stadiumService.stadiumSelect(stadiumName);

		mv.addObject("fullTime", fullTime);
		mv.addObject("stadiumVO", stadiumVO);
		mv.addObject("matchVO", matchVO);
		mv.setViewName("match/matchSelect");

		return mv;
	}
	
	@GetMapping("/match/matchWrite")
	public String matchWrite() throws Exception{
		return "match/matchWrite";
	}
	
	@PostMapping("/match/matchWrite")
	public ModelAndView matchWrite(MatchVO matchVO, String day, String time)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		String date = day+time;
		DateFormat dfm = new SimpleDateFormat("yyyy-MM-ddhh:mm");
		Date dDate = (Date)dfm.parse(date);	
		matchVO.setMatchTime(dDate);
		
		int result = matchService.matchWrite(matchVO);
		
		System.out.println(result);
		if(result>0) {
			mv.setViewName("redirect:../");
		}
		return mv;
	}
	
	@GetMapping("/match/matchDelete")
	public ModelAndView matchDelete(long num)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = matchService.matchDelete(num);
		if(result>0) {
			mv.setViewName("redirect:../");
		}
		return mv;
		
	}
	
	@GetMapping("/match/matchUpdate")
	public String matchUpdate(long num,Model model)throws Exception{
		MatchVO matchVO = matchService.matchSelect(num);
		model.addAttribute("matchVO",matchVO);
		
		return "match/matchUpdate";
	}
	


}// end class
