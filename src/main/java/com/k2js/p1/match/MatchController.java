package com.k2js.p1.match;

import java.math.MathContext;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
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
	public void matchList(Model model, int matchTime) throws Exception {
		List<MatchVO> ar = new ArrayList<MatchVO>();
		ar = matchService.matchList(matchTime);
		int i = ar.size();
		model.addAttribute("i", i);
		model.addAttribute("matchs", ar);
	}
	
	@PostMapping("getMatch")
	public void matchList(String[] addressList, int[] genderList, int day, Model model) throws Exception {
		
		if(addressList==null && genderList==null) {
			List<MatchVO> matchs = matchService.matchList(day);
			int i = matchs.size();
			model.addAttribute("i", i);
			model.addAttribute("matchs", matchs);
		} else if(addressList!=null && genderList==null) {
			List<MatchVO> ar = new ArrayList<MatchVO>();
			System.out.println("address:"+addressList.length);
			for (String addr : addressList) {
				// addr : 지역 이름
				List<MatchVO> ar1 = matchService.matchAddressList(addr, day);
				for(int i = 0; i < ar1.size(); i++) {
					ar.add(ar1.get(i));
				}
			}
			int i = ar.size();
			
			model.addAttribute("i", i);
			model.addAttribute("matchs", ar);
		} else if(addressList==null && genderList!=null) {
			List<MatchVO> mat = new ArrayList<MatchVO>();
			System.out.println("gender:"+genderList.length);
			for(int gen : genderList) {
				List<MatchVO> mat1 = matchService.matchGenderList(gen, day);
				for(int i=0; i<mat1.size(); i++) {
					mat.add(mat1.get(i));
				}
			}
			int i = mat.size();
			
			model.addAttribute("i", i);
			model.addAttribute("matchs", mat);
		}
		
		
		
		
		
		
//		List<Date> d = null;
//		
//		for(int j = 0 ; j < ar.size(); j++) {
//			System.out.println("real:"+ar.get(j).getMatchTime());
//			d = new ArrayList<Date>();
//			for(int k=0; k<=j; k++) {
//				d.add(ar.get(k).getMatchTime());
//			}
//		}
//		System.out.println("timelist:"+d.size());
//		
//		Collections.sort(d, new Comparator<Date>() {
//			
//			@Override
//			public int compare(Date o1, Date o2) {
//
//				if(o1.getTime() < o2.getTime()) {
//					return -1;
//				}else if(o1.getTime() == o2.getTime()) {
//					return 0;
//				}else {
//					return 1;
//				}
//			}
//		});
		
		
		
		
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
