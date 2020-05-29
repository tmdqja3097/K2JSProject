package com.k2js.p1.schedule;

import java.text.SimpleDateFormat;
import java.util.*;

import org.springframework.stereotype.Service;

@Service
public class ScheduleManagerService {

	public List<String> receiveDay(long startDay) throws Exception {
		int count = 0;
		int year = 0;
		int month = 0;
		int day = 0;
		List<String> dat = new ArrayList<String>();
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat yearSdf = new SimpleDateFormat("yyyy"); // 현재 년도 리턴
		SimpleDateFormat monthSdf = new SimpleDateFormat("MM"); // 현재 월 리턴
		SimpleDateFormat daySdf = new SimpleDateFormat("dd"); // 현재 일자 리턴
		SimpleDateFormat weekSdf = new SimpleDateFormat("EE"); // 현재 요일 리턴
		Date date = new Date();

		/*
		 * long lastDay = startDay + 6; System.out.println("lastDay:" + lastDay);
		 */
		for (int i = 0; i < 7; i++) {
			// 넘겨받은 startDay가 해당월의 마지막일을 넘으면
			System.out.println(startDay);
			if (startDay > cal.getActualMaximum(Calendar.DAY_OF_MONTH)|| month > Calendar.DAY_OF_MONTH) {
				year = Integer.parseInt(yearSdf.format(date));
				month = Integer.parseInt(monthSdf.format(date)) + 1;
				day = Integer.parseInt(daySdf.format(date));
			} else {
				year = Integer.parseInt(yearSdf.format(date));
				month = Integer.parseInt(monthSdf.format(date));
				day = Integer.parseInt(daySdf.format(date));

			}
			if (count < 7) {
				System.out.println("월의 마지막요일" + cal.getActualMaximum(Calendar.DAY_OF_MONTH));
				if (startDay > cal.getActualMaximum(Calendar.DAY_OF_MONTH)) {
					startDay = (startDay - cal.getActualMaximum(Calendar.DAY_OF_MONTH));
					Date date1 = new Date(year, month - 1, (int) startDay - 1);
					dat.add((int) startDay + "/" + weekSdf.format(date1));
					count++;
					startDay++;
				} else {
					Date date1 = new Date(year, month - 1, (int) startDay - 1);
					dat.add((int) startDay + "/" + weekSdf.format(date1));
					count++;
					startDay++;
				}

			}
		}
		return dat;

	}

}
