package com.k2js.p1.match;

import java.math.MathContext;
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
		
		
		int i = matchVOs.size();
		
		
//		for (int j = 0; j < i; j++) {
//			MatchVO matchVO = new MatchVO();
//			String stadiumName = matchVOs.get(j).getStadiumName();
//			StadiumVO stadiumVO = stadiumService.stadiumSelect(stadiumName);
//			matchVO = matchService.matchAddressList(matchTime, stadiumName);
//		}
		
		model.addAttribute("matchs", matchVOs);
		model.addAttribute("i", i);

	}
	
	
	@ResponseBody
	@PostMapping("getMatch")
	public ModelAndView matchAddrList(String[] addressList, int day, ModelAndView mav) throws Exception{
		//오늘 날짜 (일)
		System.out.println(day);
		//모달에서 누른 value 값(누른 양에 따라 배열로 옴)
		System.out.println(addressList);
		System.out.println(addressList.length);
		System.out.println(addressList[0].toString());
		System.out.println("---------------");
		List<MatchVO> matchVOs = matchService.matchList(day);
		int ms = matchVOs.size();
		List<MatchVO> matchVOs1 = new ArrayList<MatchVO>();
		
		List<MatchVO> matchVOsAddr = new ArrayList<MatchVO>();
		
		for(int i=0; i<ms; i++) {
			MatchVO matchVO = new MatchVO();
			MatchVO matchVO1 = new MatchVO();
			
			String stadiumName = matchVOs.get(i).getStadiumName();
			StadiumVO stadiumVO = stadiumService.stadiumSelect(stadiumName);
			//System.out.println("getaddress: "+stadiumVO.getAddress());
			
			String[] address = new String[ms]; 
			address[i] = stadiumVO.getAddress();
			
			System.out.println("addr: "+address[i]);
			
			matchVO = matchService.matchAddrList(day, stadiumName);
			matchVO1 = matchService.matchAddressList(address[i]);
		
			
			matchVOs1.add(matchVO);
			matchVOsAddr.add(matchVO1);
			
		}
		
		mav.addObject("matchs", matchVOs1);
		
		System.out.println("address1: "+matchVOsAddr.get(0).getStadiumName());
//		System.out.println("address2: "+stadiumVOs.get(1).getAddress());
//		System.out.println("address3: "+stadiumVOs.get(2).getAddress());
		System.out.println("----");
		
		
		
		
		
		
//		String[] value = new String[ms];
//		
//		for(String address:addressList) {
//			System.out.println(address);
//			for(int i=0; i<ms; i++) {
//				
//				if(address.equals("seoul")) {
//					if(stadiumVOs.get(i).getAddress().equals("seoul")) {
//						value[i] = matchVOs1.get(i).getTitle().toString(); 
//					}else {
//						value[i] = "n";
//					}
//				}else if(address.equals("daegu")){
//					if(stadiumVOs.get(i).getAddress().equals("daegu")) {
//						value[i] = matchVOs1.get(i).getTitle().toString();
//					}else {
//						value[i] = "n";
//					}
//				}else if(address.equals("gyeonggi")) {
//					if(stadiumVOs.get(i).getAddress().equals("gyeonggi")) {
//						value[i] = matchVOs1.get(i).getTitle().toString();
//					}else {
//						value[i] = "n";
//					}
//				}
//				else {
//					value[i] = "not";
//				}
//				
//				
//			}
//			System.out.println(value.length);
//			System.out.println(value[0]);
//			System.out.println(value[1]);
//			System.out.println(value[2]);
//			System.out.println(value[3]);
//			
//		}
		mav.addObject("ms", ms);
		//mav.addObject("filterValue", value);
		mav.setViewName("getMatch");
		
		return mav;
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
