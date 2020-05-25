package com.k2js.p1.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.k2js.p1.board.BoardVO;
import com.k2js.p1.util.Pager;

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
	
	@GetMapping("managerList")
	public ModelAndView managerList(Pager pager, ModelAndView mv)throws Exception{	
		 List<ManagerVO> ar = managerService.managerList(pager);
		 mv.addObject("list", ar);
		 mv.addObject("pager", pager);
		 
		 mv.setViewName("manager/managerList");
		 
		 return mv;
	}
	
	
}
