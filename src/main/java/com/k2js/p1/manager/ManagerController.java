package com.k2js.p1.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/manager/**")
public class ManagerController {
	@Autowired
	private ManagerService managerService;
	
	@GetMapping("managerOffer")
	public void managerOffer() throws Exception {
	}

	@GetMapping("addManager")
	public void addManager() throws Exception {
	}

	@PostMapping("addManager")
	public ModelAndView addManager(ManagerVO managerVO, MultipartFile[] files, ModelAndView mv) throws Exception {
		System.out.println("files : " +managerVO.getHome());
		System.out.println("files : "+files);
		int result = managerService.addManager(managerVO, files);

		if (result > 0) {
			mv.setViewName("redirect:./managerOffer");
		} else {
			mv.addObject("result", "Write Fail");
			mv.addObject("path", "./managerOffer");
			mv.setViewName("common/result");
		}
		return mv;
	}
}
