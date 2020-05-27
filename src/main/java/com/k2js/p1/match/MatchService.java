package com.k2js.p1.match;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.k2js.p1.stadium.StadiumDAO;
import com.k2js.p1.stadium.StadiumVO;

@Service
public class MatchService {

	@Autowired
	private MatchDAO matchDAO;
	@Autowired
	private StadiumDAO stadiumDAO;
	
	
	public List<MatchVO> matchGenderList(int gender, int day) throws Exception{
		MatchVO matchVO = new MatchVO();
		matchVO.setGender(gender);
		matchVO.setDay(day);
		return matchDAO.matchGenderList(matchVO);
	}
	 
	public List<MatchVO> matchAddressList(String address, int day) throws Exception{
		StadiumVO stadiumVO = new StadiumVO();
		stadiumVO.setAddress(address);
		stadiumVO.setDay(day);
		return matchDAO.matchAddressList(stadiumVO);
	}
	
	public int matchDelete(long num)throws Exception{
		return matchDAO.matchDelete(num);
	}
	
	public int matchWrite(MatchVO matchVO)throws Exception{
		matchVO.setNum(matchDAO.matchNum());
		System.out.println("number : "+matchVO.getNum());
		return matchDAO.matchWrite(matchVO);
	}

	public List<MatchVO> matchList(int day) throws Exception{

		return matchDAO.matchList(day);
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
