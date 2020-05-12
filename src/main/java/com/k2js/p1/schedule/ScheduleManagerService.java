package com.k2js.p1.schedule;

import java.text.SimpleDateFormat;
import java.util.*;

import org.springframework.stereotype.Service;

@Service
public class ScheduleManagerService {

	public List<String> receiveDay(long startDay) throws Exception {
		int count = 0;

		List<String> dat = new ArrayList<String>();
		Date date = new Date();
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat yearSdf = new SimpleDateFormat("yyyy"); // 현재 년도 리턴
		int year = Integer.parseInt(yearSdf.format(date));
		SimpleDateFormat monthSdf = new SimpleDateFormat("MM"); // 현재 월 리턴
		int month = Integer.parseInt(monthSdf.format(date));
		SimpleDateFormat daySdf = new SimpleDateFormat("dd"); // 현재 일자 리턴
		int day = Integer.parseInt(daySdf.format(date));
		SimpleDateFormat weekSdf = new SimpleDateFormat("EE"); // 현재 요일 리턴

		long lastDay = startDay + 6;

			for (int i = 0; i < 7; i++) {
				if (count < 7) {
					if (startDay > cal.getActualMaximum(month)) {
					startDay = 1;
					month = month + 1;
					lastDay = startDay + 6 - count;

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
