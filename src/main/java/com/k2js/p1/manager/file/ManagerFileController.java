package com.k2js.p1.manager.file;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/managerFile/**")
public class ManagerFileController {

	@Autowired
	private ManagerFileService managerFileService;

	@PostMapping("fileDelete")
	public ModelAndView fileDelete(long fileNum) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = managerFileService.fileDelete(fileNum);
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}

	@GetMapping("fileDown")
	public ModelAndView fileDown(ManagerFileVO managerFileVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		managerFileVO = managerFileService.fileSelect(managerFileVO);
		mv.addObject("file", managerFileVO);
		mv.setViewName("fileDown");
		return mv;
	}
}
