package com.k2js.p1.qna;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.k2js.p1.board.file.BoardFileDAO;
import com.k2js.p1.board.file.BoardFileVO;
import com.k2js.p1.util.FileSaver;
import com.k2js.p1.board.BoardService;
import com.k2js.p1.board.BoardVO;
import com.k2js.p1.notice.NoticeDAO;
import com.k2js.p1.util.Pager;

@Service
public class QnaService implements BoardService{

	@Autowired
	private QnaDAO qnaDAO;	
	@Autowired
	private ServletContext servletContext;
	@Autowired
	private FileSaver fileSaver;
	@Autowired
	private BoardFileDAO boardFileDAO;
	

	@Override
	public List<BoardVO> boardList(Pager pager) throws Exception {
		
		pager.makeRow();
		long totalCount = qnaDAO.boardCount(pager);
		pager.makePage(totalCount);
		
		return qnaDAO.boardList(pager);
	}


	@Override
	public BoardVO boardSelect(long num) throws Exception {
		// TODO Auto-generated method stub
		return qnaDAO.boardSelect(num);
	}

	@Override
	public int boardWrite(BoardVO boardVO, MultipartFile [] files) throws Exception {
		// TODO Auto-generated method stub
		String path = servletContext.getRealPath("/resources/uploadqna");
		//sequence 번호 받기
		boardVO.setNum(qnaDAO.boardNum());
		//notice table insert
		int result = qnaDAO.boardWrite(boardVO);
		
		for(MultipartFile file : files) {
			if(file.getSize()>0) {
				BoardFileVO boardFileVO = new BoardFileVO();
				String fileName = fileSaver.saveByTransfer(file, path);
				boardFileVO.setNum(boardVO.getNum());
				boardFileVO.setFileName(fileName);
				boardFileVO.setOriName(file.getOriginalFilename());
				boardFileVO.setBoard(1);
				boardFileDAO.fileInsert(boardFileVO);
			}
		}
		return result;
	}

	@Override
	public int boardUpdate(BoardVO boardVO, MultipartFile[] files) throws Exception {
		String path = servletContext.getRealPath("/resources/uploadqna");
		
		for(MultipartFile file : files) {
			if(file.getSize()>0) {
				BoardFileVO boardFileVO = new BoardFileVO();
				String fileName = fileSaver.saveByTransfer(file, path);
				boardFileVO.setNum(boardVO.getNum());
				boardFileVO.setFileName(fileName);
				boardFileVO.setOriName(file.getOriginalFilename());
				boardFileVO.setBoard(1);
				int result = boardFileDAO.fileInsert(boardFileVO);
			}
		}
	
		 return qnaDAO.boardUpdate(boardVO); 
	}

	@Override
	public int boardDelete(long num) throws Exception {
		// TODO Auto-generated method stub
		return qnaDAO.boardDelete(num);
	}
}
