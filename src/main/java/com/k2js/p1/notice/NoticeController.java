package com.k2js.p1.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.k2js.p1.notice.NoticeService;
import com.k2js.p1.board.BoardVO;
import com.k2js.p1.util.Pager;

@Controller
@RequestMapping("/notice/**")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@ModelAttribute("board")
	public String getBoard()throws Exception{
		return "Notice";
	}
	
	@RequestMapping(value = "noticeList", method = RequestMethod.GET)
	public ModelAndView boardList(Pager pager, ModelAndView mv)throws Exception{
			
		 List<BoardVO> ar = noticeService.boardList(pager);
		 mv.addObject("list", ar);
		 mv.addObject("pager", pager);
		 
		 mv.setViewName("board/boardList");
		 
		 return mv;
	}

}
