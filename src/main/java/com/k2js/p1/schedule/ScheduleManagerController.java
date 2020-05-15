package com.k2js.p1.schedule;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/")
public class ScheduleManagerController {
	@Autowired
	private ScheduleManagerService sms;
	
	@GetMapping(value = "getList")
	public void mathchInfoDay(long startDay,Model model) throws Exception{
		List<String> ar = sms.receiveDay(startDay);
		model.addAttribute("day",ar);
	}
	
		

}
