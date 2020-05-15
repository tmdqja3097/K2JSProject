package com.k2js.p1.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.k2js.p1.board.BoardVO;
import com.k2js.p1.util.Pager;

@Controller
@RequestMapping("/qna/**")
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	@ModelAttribute("board")
	public String getBoard()throws Exception{
		return "qna";
	}
	
	@RequestMapping(value = "qnaList", method = RequestMethod.GET)
	public ModelAndView boardList(Pager pager, ModelAndView mv)throws Exception{
			
		 List<BoardVO> ar = qnaService.boardList(pager);
		 mv.addObject("list", ar);
		 mv.addObject("pager", pager);
		 System.out.println(pager.getStartNum());
		 System.out.println(pager.getLastNum());
		 System.out.println(pager.getTotalPage());
		 System.out.println(pager.getCurBlock());
		 System.out.println(pager.getTotalBlock());
		 mv.setViewName("board/boardList");
		 
		 return mv;
	}
	
	
	@RequestMapping(value = "qnaDelete", method = RequestMethod.GET)
	public ModelAndView boardDelete(long num, ModelAndView mv)throws Exception{
		int result = qnaService.boardDelete(num);
		if(result>0) {
			mv.addObject("result", "Delete Success");
		}else {
			mv.addObject("result", "Delete Fail");
		}
		mv.addObject("path", "./qnaList");
		mv.setViewName("common/result");
		return mv;
	}
	
	@RequestMapping(value = "qnaUpdate", method = RequestMethod.GET)
	public String boardUpdate(long num, Model model)throws Exception{
		 BoardVO boardVO = qnaService.boardSelect(num);
		 model.addAttribute("vo", boardVO);
		 QnaVO qnaVO = (QnaVO)boardVO;
		 
		return "board/boardUpdate";
	}
	
	@RequestMapping(value = "qnaUpdate", method = RequestMethod.POST)
	public String boardUpdate(QnaVO qnaVO, MultipartFile[] files)throws Exception{
		 
		int result = qnaService.boardUpdate(qnaVO, files);
		
		String path="";
		
		if(result>0) {
			path= "redirect:./qnaList";
		}else {
			path= "redirect:./qnaSelect?num="+qnaVO.getNum();
		}
		 
		return path;
	}
	
	
	@RequestMapping(value = "qnaWrite", method = RequestMethod.GET)
	public String boardWrite()throws Exception{
		return "board/boardWrite";
	}
	
	@RequestMapping(value = "qnaWrite", method = RequestMethod.POST)
	public ModelAndView boardWrite(QnaVO qnaVO,MultipartFile [] files, ModelAndView mv)throws Exception{
		int result = qnaService.boardWrite(qnaVO, files);
		
		if(result>0) {
			mv.setViewName("redirect:./qnaList");
		}else {
			mv.addObject("result", "Write Fail");
			mv.addObject("path", "./qnaList");
			mv.setViewName("common/result");
		}	
		return mv;
	}
	
	@RequestMapping(value="qnaSelect" , method = RequestMethod.GET)
	public ModelAndView boardSelect(long num)throws Exception{
		ModelAndView mv = new ModelAndView();
		BoardVO boardVO = qnaService.boardSelect(num);
		mv.addObject("vo", boardVO);
		mv.setViewName("board/boardSelect");
		return mv;
	}

}