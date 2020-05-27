package com.k2js.p1.stadium.file;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.k2js.p1.stadium.file.*;

@Controller
@RequestMapping("/stadiumFile/**")
public class StadiumFileController {
	@Autowired
	private StadiumFileService stadiumFileService;
	
	@PostMapping("fileDelete")
	public ModelAndView fileDelete(long fileNum)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = stadiumFileService.fileDelete(fileNum);
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@GetMapping("fileDown")
	public ModelAndView fileDown(StadiumFileVO stadiumFileVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		stadiumFileVO = stadiumFileService.fileSelect(stadiumFileVO);
		mv.addObject("file", stadiumFileVO);
		mv.setViewName("fileDown");
		return mv;
	}

}
