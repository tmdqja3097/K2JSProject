package com.k2js.p1.match;

import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.k2js.p1.member.MemberVO;
import com.k2js.p1.stadium.file.StadiumFileDAO;
import com.k2js.p1.stadium.file.StadiumFileVO;
import com.k2js.p1.util.FileSaver;



@Service
public class MatchService {

	@Autowired
	private MatchDAO matchDAO;
	@Autowired
	private ServletContext servletContext;
	@Autowired
	private FileSaver fileSaver;
	@Autowired
	private StadiumFileDAO stadiumFileDAO;
	
	
	public int matchUpdate(MatchVO matchVO) throws Exception {
		return matchDAO.matchUpdate(matchVO);
	}
	
	
	public int matchDelete(long num)throws Exception{
		return matchDAO.matchDelete(num);
	}
	
	public int matchWrite(MatchVO matchVO, MultipartFile [] files)throws Exception{
		String path = servletContext.getRealPath("/resources/uploadstadium");
		System.out.println(path);
		matchVO.setNum(matchDAO.matchNum());
		
		for(MultipartFile file : files) {
			if(file.getSize()>0) {
				StadiumFileVO stadiumFileVO = new StadiumFileVO();
				String fileName = fileSaver.saveByTransfer(file, path);
				stadiumFileVO.setNum(matchVO.getNum());
				stadiumFileVO.setFileName(fileName);
				stadiumFileVO.setOriName(file.getOriginalFilename());
				stadiumFileDAO.fileInsert(stadiumFileVO);
			}
		}
		
		return matchDAO.matchWrite(matchVO);
	}

	public List<MatchVO> matchList(int day) throws Exception{
		List<MatchVO> matchs = matchDAO.matchList(day);
		/*
		 * for(int i=0;i<matchs.size();i++) { if(matchs.get(i).getGender()) }
		 */
		return matchDAO.matchList(day);
	}
	
	 public int matchJoin(MatchVO matchVO, MemberVO memberVO)throws Exception{
		 MatchVO match = matchSelect(matchVO.getNum());
		 long count = matchVO.getCount();
		 match.setCount(match.getCount()+count);
			
		 String joinMemberId = match.getJoinMemberId();
		 match.setJoinMemberId(joinMemberId+memberVO.getId()+",");
	
		 
		 return matchDAO.matchJoin(match);
	 }
	 
	 public int matchJoin(long num, MemberVO memberVO)throws Exception{
		 
		 return matchDAO.matchJoin(memberVO);
	 }
	 
	
	public MatchVO matchSelect(long num) throws Exception{
		MatchVO matchVO = matchDAO.matchSelect(num);
		
		String fullTime = matchVO.getMatchTime().toString();
	
		String yoil = fullTime.substring(0,3);
		String month = fullTime.substring(4,7);
		String day = fullTime.substring(8,10);
		String time = fullTime.substring(11,16);
		String year = fullTime.substring(24,28);
		
		
		if(yoil.equals("Mon")) {
			yoil = "월요일";
		}else if(yoil.equals("Tue")) {
			yoil = "화요일";
		}else if(yoil.equals("Wed")) {
			yoil = "수요일";
		}else if(yoil.equals("Thu")) {
			yoil = "목요일";
		}else if(yoil.equals("Fri")) {
			yoil = "금요일";
		}else if(yoil.equals("Sat")) {
			yoil = "토요일";
		}else if(yoil.equals("Sun")) {
			yoil = "일요일";
		}
		
		if(month.equals("Jan")) {
			month = "1";
		}else if(month.equals("Feb")) {
			month = "2";
		}else if(month.equals("Mar")) {
			month = "3";
		}else if(month.equals("Apr")) {
			month = "4";
		}else if(month.equals("May")) {
			month = "5";
		}else if(month.equals("Jun")) {
			month = "6";
		}else if(month.equals("Jul")) {
			month = "7";
		}else if(month.equals("Aug")) {
			month = "8";
		}else if(month.equals("Sep")) {
			month = "9";
		}else if(month.equals("Oct")) {
			month = "10";
		}else if(month.equals("Nov")) {
			month = "11";
		}else if(month.equals("Dec")) {
			month = "12";
		}
	
		
		fullTime = year+"년 "+month+"월 "+day+"일 "+yoil+" "+time;
		
		matchVO.setFullTime(fullTime);
		return matchVO;
	}
}
