package com.k2js.p1.qna;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.k2js.p1.util.Pager;

@Controller
@RequestMapping("/qna/**")
public class QnaController {

	@ModelAttribute("board")
	public String getBoard()throws Exception{
		return "Qna";
	}
	
	@RequestMapping(value = "qnaList", method = RequestMethod.GET)
	public ModelAndView boardList(Pager pager, ModelAndView mv)throws Exception{
		
		/*
		 * List<BoardVO> ar = noticeService.boardList(pager); mv.addObject("list", ar);
		 * mv.addObject("pager", pager);
		 */
		 mv.setViewName("board/boardList");
		 return mv;
	}
}
