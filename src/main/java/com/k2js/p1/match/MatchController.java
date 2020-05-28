package com.k2js.p1.match;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.k2js.p1.manager.ManagerService;
import com.k2js.p1.manager.ManagerVO;
import com.k2js.p1.matchforcapa.MatchForCapaVO;
import com.k2js.p1.member.MemberVO;
import com.k2js.p1.stadium.StadiumService;
import com.k2js.p1.stadium.StadiumVO;

@Controller
@RequestMapping("/")
public class MatchController {

	@Autowired
	private MatchService matchService;
	@Autowired
	private StadiumService stadiumService;
	@Autowired
	private ManagerService managerService;

	@GetMapping("getMatch")
	public void matchList(int matchTime, Model model) throws Exception {
		List<MatchVO> matchVOs = matchService.matchList(matchTime);
		int i = matchVOs.size();
		model.addAttribute("matchs", matchVOs);
		model.addAttribute("i", i);
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
		
	}
	
	@GetMapping("about")
	public void about()throws Exception{
		
	}

	@GetMapping("/match/matchSelect")
	public ModelAndView matchSelect(long num, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		MatchForCapaVO mfcVO = new MatchForCapaVO();
		if (memberVO != null) {
			mfcVO.setCapaListNum(memberVO.getCapaListNum());
			mfcVO.setNum(num);
			mfcVO = matchService.matchIfJoin(mfcVO);
			if (mfcVO != null) {
				mv.addObject("matchIfJoin", mfcVO);
			} else {
				mv.addObject("matchIfJoin");
			}
		}

		MatchVO matchVO = matchService.matchSelect(num);
		String fullTime = matchService.matchSelect(num).getFullTime();
		long manager_num = matchVO.getManagerNum();  
		String stadiumName = matchVO.getStadiumName();
		StadiumVO stadiumVO = stadiumService.stadiumSelect(stadiumName);
		ManagerVO managerVO = managerService.managerSelect(manager_num);

		mv.addObject("managerVO", managerVO);
		mv.addObject("fullTime", fullTime);
		mv.addObject("stadiumVO", stadiumVO);
		mv.addObject("matchVO", matchVO);

		mv.setViewName("match/matchSelect");

		return mv;
	}

	@GetMapping("/match/matchWrite")
	public ModelAndView matchWrite() throws Exception {
		ModelAndView mv = new ModelAndView();
		List<StadiumVO> stadiumVOs = stadiumService.stadiumList();
		mv.addObject("stadiumVOs", stadiumVOs);
		mv.setViewName("match/matchWrite");
		return mv;
	}

	@PostMapping("/match/matchWrite")
	public ModelAndView matchWrite(MatchVO matchVO,String day,String time, MultipartFile[] files) throws Exception {
		ModelAndView mv = new ModelAndView();
		String date = day + time;
		DateFormat dfm = new SimpleDateFormat("yyyy-MM-ddHH:mm");
		Date dDate = (Date) dfm.parse(date);
		matchVO.setMatchTime(dDate);

		int result = matchService.matchWrite(matchVO, files);
		if (result > 0) {
			mv.setViewName("redirect:../");
		}
		return mv;
	}

	@GetMapping("/match/matchDelete")
	public ModelAndView matchDelete(long num) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = matchService.matchDelete(num);
		if (result > 0) {
			mv.setViewName("redirect:../");
		}
		return mv;

	}

	@GetMapping("/match/matchUpdate")
	public String boardUpdate(long num, Model model) throws Exception {
		MatchVO matchVO = matchService.matchSelect(num);
		model.addAttribute("matchVO", matchVO);
		return "match/matchUpdate";
	}

	@PostMapping("/match/matchUpdate")
	public String matchUpdate(MatchVO matchVO, String day, String time) throws Exception {

		String date = day + time;
		DateFormat dfm = new SimpleDateFormat("yyyy-MM-ddhh:mm");
		Date dDate = (Date) dfm.parse(date);
		matchVO.setMatchTime(dDate);

		int result = matchService.matchUpdate(matchVO);
		String path = "";
		result = 0;
		if (result > 0) {
			path = "redirect:../";
		} else {
			path = "redirect:./matchSelect?num=" + matchVO.getNum();
		}
		return path;
	}

	@GetMapping("/match/matchJoin")
	public ModelAndView matchJoin(long num) throws Exception {
		ModelAndView mv = new ModelAndView();
		MatchVO matchVO = matchService.matchSelect(num);
		mv.addObject("matchVO", matchVO);
		mv.setViewName("match/matchJoin");

		return mv;
	}

	@PostMapping("/match/matchJoin")
	public ModelAndView matchJoin(MatchVO matchVO, HttpSession session, int counted, ModelAndView mv, int dicountMoney)
			throws Exception {
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		int result = matchService.matchJoin(matchVO, memberVO, counted, dicountMoney);
		if (result > 0) {
			MatchVO match = matchService.matchSelect(matchVO.getNum());
			mv.addObject("matchVO", match);
			mv.setViewName("match/matchComplete");
		} else {
			mv.setViewName("match/matchFail");
		}
		return mv;
	}

	@GetMapping("/match/matchCancel")
	public String matchCancel(long num, Model model) throws Exception {
		model.addAttribute("num", num);
		return "match/matchCancel";
	}

	@PostMapping("/match/matchCancel")
	public void matchCancel(long num, HttpSession session) throws Exception {
		MatchForCapaVO mfcVO = new MatchForCapaVO();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		mfcVO.setNum(num);
		mfcVO.setCapaListNum(memberVO.getCapaListNum());
		matchService.matchCancel(mfcVO, memberVO);
	}

}// end class
