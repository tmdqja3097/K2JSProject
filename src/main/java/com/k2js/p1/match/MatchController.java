package com.k2js.p1.match;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/")
public class MatchController {

	@Autowired
	private MatchService matchService;
	
	
	@GetMapping("matchList")
	public ModelAndView matchList(Date date, MatchVO matchVO) throws Exception {
		
		List<MatchVO> ar = matchService.matchList(date);
		ModelAndView mv = new ModelAndView();
		
		System.out.println(ar);
		System.out.println(date);
		//System.out.println(matchVO.getMatchTime());
		
		mv.addObject("list", ar);
		mv.addObject("date", date);
		mv.setViewName("./home");
		
		return mv;
		
	}//end matchList
	
	
	@GetMapping("matchSelect")
	public ModelAndView matchSelect(long num) throws Exception{
		ModelAndView mv = new ModelAndView();
		MatchVO matchVO = matchService.matchSelect(num);
		mv.addObject("vo", matchVO);
		mv.setViewName("match/playSelect");
		
		return mv;
	}
	
	
	/*
	 * @GetMapping("matchDate") public ModelAndView matchDate(MatchVO matchVO)
	 * throws Exception{ ModelAndView mv = new ModelAndView();
	 * 
	 * 
	 * Calendar cal = Calendar.getInstance();
	 * 
	 * Date date = new Date();
	 * 
	 * SimpleDateFormat yearSdf = new SimpleDateFormat("yyyy");
	 * 
	 * SimpleDateFormat monthSdf = new SimpleDateFormat("MM");
	 * 
	 * SimpleDateFormat daySdf = new SimpleDateFormat("dd");
	 * 
	 * int year = Integer.parseInt(yearSdf.format(date)); System.out.println(year);
	 * int month = Integer.parseInt(monthSdf.format(date));
	 * System.out.println(month); int day = Integer.parseInt(daySdf.format(date));
	 * System.out.println(day); day = 20; //firstDate = 달의 첫번째 날짜 //totalDate = 전체
	 * 날짜 수 //remainDate = 남은 날짜 수 int firstDate = cal.getActualMinimum(cal.DATE);
	 * int totalDate = cal.getActualMaximum(cal.DATE); int remainDate =
	 * cal.getActualMaximum(cal.DATE)-day;
	 * 
	 * System.out.println(remainDate);
	 * 
	 * int [] dat = new int[remainDate+1]; int [] week2 = new int[14];
	 * 
	 * //month는 0 부터 시작하니 -1을 해줘야 1일때 1월이 나옴
	 * 
	 * cal.set(year, month-1, day);
	 * 
	 * // for(int i=0; i+day<=totalDate; i++) { // dat[i] = i+day; //
	 * System.out.print(dat[i]+" ["+i+"] "); // // }
	 * 
	 * System.out.println();
	 * 
	 * for(int i=0; i<14; i++) { week2[i] = i+day; //System.out.print(week2[i]+" ");
	 * if(week2[13] > totalDate) { int monthPlus = month+1; for(int j=0; j<13; j++)
	 * { week2[i-j] = firstDate+j;
	 * 
	 * }
	 * 
	 * } //System.out.println(); System.out.print(week2[i]+" "); }
	 * System.out.println(); //System.out.println(week2[13]);
	 * 
	 * System.out.println();
	 * 
	 * // for(int i=0; i<14; i++) { // System.out.print(dat[i]+" "); // }
	 * 
	 * 
	 * 
	 * Date matchDate = matchService.matchDate(matchVO);
	 * 
	 * 
	 * 
	 * return mv; }
	 */
	 
	
	
	
}//end class
