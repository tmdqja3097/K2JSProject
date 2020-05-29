package com.k2js.p1.match;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.k2js.p1.matchforcapa.MatchForCapaVO;
import com.k2js.p1.member.MemberVO;
import com.k2js.p1.member.charge.ChargeDAO;
import com.k2js.p1.stadium.file.StadiumFileDAO;
import com.k2js.p1.stadium.file.StadiumFileVO;
import com.k2js.p1.util.FileSaver;

import com.k2js.p1.stadium.StadiumDAO;
import com.k2js.p1.stadium.StadiumVO;

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
	@Autowired
	private ChargeDAO chargeDAO;
	@Autowired
	private StadiumDAO stadiumDAO;

	public int matchUpdate(MatchVO matchVO, MultipartFile[] files) throws Exception {
		String path = servletContext.getRealPath("/resources/uploadstadium");
		
		for (MultipartFile file : files) {
			if (file.getSize() > 0) {
				StadiumFileVO stadiumFileVO = new StadiumFileVO();
				String fileName = fileSaver.saveByTransfer(file, path);
				stadiumFileVO.setNum(matchVO.getNum());
				stadiumFileVO.setFileName(fileName);
				stadiumFileVO.setOriName(file.getOriginalFilename());
				stadiumFileDAO.fileInsert(stadiumFileVO);
			}
		}
		return matchDAO.matchUpdate(matchVO);
	}

	public List<MatchVO> matchGenderList(int gender, int day) throws Exception{
		MatchVO matchVO = new MatchVO();
		matchVO.setGender(gender);
		matchVO.setDaily(day);
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

	public int matchWrite(MatchVO matchVO, MultipartFile[] files) throws Exception {
		String path = servletContext.getRealPath("/resources/uploadstadium");
		matchVO.setNum(matchDAO.matchNum());

		for (MultipartFile file : files) {
			if (file.getSize() > 0) {
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

	public List<MatchVO> matchList(int day) throws Exception {
		List<MatchVO> matchs = matchDAO.matchList(day);
		/*
		 * for(int i=0;i<matchs.size();i++) { if(matchs.get(i).getGender()) }
		 */
		return matchDAO.matchList(day);
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int matchJoin(MatchVO matchVO, MemberVO memberVO, int counted, int dicountMoney) throws Exception {
		int result = 0;
		MatchForCapaVO mfcVO = new MatchForCapaVO();
		matchVO.setCount(matchVO.getCount() + counted);
		if (matchVO.getCount() < 17) {
			result = matchDAO.matchJoin(matchVO);
			if (result > 0) {
				mfcVO.setCapaListNum(memberVO.getCapaListNum());
				mfcVO.setNum(matchVO.getNum());
				mfcVO.setCount(counted);
				matchDAO.matchForCapa(mfcVO);
				memberVO.setCash(memberVO.getCash() - dicountMoney);
				result = matchDAO.discountMemberCash(memberVO);
			}
		}
		return result;

	}
	public MatchForCapaVO matchIfJoin(MatchForCapaVO mfcVO) throws Exception {
		mfcVO = matchDAO.matchSearch(mfcVO);
		return mfcVO;
	}

	public MatchVO matchSelect(long num) throws Exception {
		MatchVO matchVO = matchDAO.matchSelect(num);

		String fullTime = matchVO.getMatchTime().toString();

		String yoil = fullTime.substring(0, 3);
		String month = fullTime.substring(4, 7);
		String day = fullTime.substring(8, 10);
		String time = fullTime.substring(11, 16);
		String year = fullTime.substring(24, 28);

		if (yoil.equals("Mon")) {
			yoil = "월요일";
		} else if (yoil.equals("Tue")) {
			yoil = "화요일";
		} else if (yoil.equals("Wed")) {
			yoil = "수요일";
		} else if (yoil.equals("Thu")) {
			yoil = "목요일";
		} else if (yoil.equals("Fri")) {
			yoil = "금요일";
		} else if (yoil.equals("Sat")) {
			yoil = "토요일";
		} else if (yoil.equals("Sun")) {
			yoil = "일요일";
		}

		if (month.equals("Jan")) {
			month = "1";
		} else if (month.equals("Feb")) {
			month = "2";
		} else if (month.equals("Mar")) {
			month = "3";
		} else if (month.equals("Apr")) {
			month = "4";
		} else if (month.equals("May")) {
			month = "5";
		} else if (month.equals("Jun")) {
			month = "6";
		} else if (month.equals("Jul")) {
			month = "7";
		} else if (month.equals("Aug")) {
			month = "8";
		} else if (month.equals("Sep")) {
			month = "9";
		} else if (month.equals("Oct")) {
			month = "10";
		} else if (month.equals("Nov")) {
			month = "11";
		} else if (month.equals("Dec")) {
			month = "12";
		}

		fullTime = year + "년 " + month + "월 " + day + "일 " + yoil + " " + time;

		matchVO.setFullTime(fullTime);
		return matchVO;
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int matchCancel(MatchForCapaVO mfcVO, MemberVO memberVO) throws Exception {
		long count = 0;
		int daycount = 0;
		// 매치신청 결제정보 호출
		mfcVO = matchDAO.matchSearch(mfcVO);
		// 결제정보에서 삭제
		matchDAO.matchCancel(mfcVO);
		MatchVO matchVO = matchDAO.matchSelect(mfcVO.getNum());
		matchVO.setNum(mfcVO.getNum());
		matchVO.setCount(matchVO.getCount() - mfcVO.getCount());
		// 해당 매치 정보에서 카운트 차감
		matchDAO.matchJoin(matchVO);
		// 날자 비교 및 환불금액 변동사항
		Date date = new Date();
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		String dat = sdf.format(matchVO.getMatchTime());
		String dat1 = sdf.format(date);
		//// 경기 날자
		String str[] = dat.split("/");
		int year = Integer.parseInt(str[0]);
		int month = Integer.parseInt(str[1]);
		int maxday = cal.getActualMaximum(month-1);
		int day = Integer.parseInt(str[2]) - 2;
		//// 현재 날자
		String str1[] = dat1.split("/");
		int year1 = Integer.parseInt(str[0]);
		int month1 = Integer.parseInt(str1[1]);
		int day1 = Integer.parseInt(str[2]);
		if (year == year1 && month == month1) {
			daycount = day - day1;
		} else if (year == year1 && month > month1) {
			daycount = (day+maxday)-day1;
		} else if ( year != year1) {
			daycount = (day+31)-day1;
		}
		System.out.println(daycount);
		if (daycount > 2) {
			count = mfcVO.getCount() * 10000;
		} else if (daycount < 2 && daycount > 1) {
			count = mfcVO.getCount() * 8000;
		} else if (daycount < 1) {
			count = mfcVO.getCount() * 3000;
		}
		// 멤버에서 캐쉬를 카운트만큼 입금
		count = mfcVO.getCount()*10000;
		memberVO.setCash(memberVO.getCash()+(int)count);
		return chargeDAO.cancelMoneyCharge(memberVO);
	}
}
