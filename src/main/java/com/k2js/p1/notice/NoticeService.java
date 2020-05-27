package com.k2js.p1.notice;

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
public class NoticeService implements BoardService{

	@Autowired
	private NoticeDAO noticeDAO;	
	@Autowired
	private ServletContext servletContext;
	@Autowired
	private FileSaver fileSaver;
	@Autowired
	private BoardFileDAO boardFileDAO;
	

	@Override
	public List<BoardVO> boardList(Pager pager) throws Exception {
		
		pager.makeRow();
		long totalCount = noticeDAO.boardCount(pager);
		pager.makePage(totalCount);
		
		return noticeDAO.boardList(pager);
	}


	@Override
	public BoardVO boardSelect(long num) throws Exception {
		// TODO Auto-generated method stub
		return noticeDAO.boardSelect(num);
	}

	@Override
	public int boardWrite(BoardVO boardVO, MultipartFile [] files) throws Exception {
		// TODO Auto-generated method stub
		String path = servletContext.getRealPath("/resources/uploadnotice");
		System.out.println(path);
		
		//sequence 번호 받기
		boardVO.setNum(noticeDAO.boardNum());
		//notice table insert
		int result = noticeDAO.boardWrite(boardVO);
		
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
		String path = servletContext.getRealPath("/resources/uploadnotice");
		
		for(MultipartFile file : files) {
			if(file.getSize()>0) {
				BoardFileVO boardFileVO = new BoardFileVO();
				String fileName = fileSaver.saveByTransfer(file, path);
				boardFileVO.setNum(boardVO.getNum());
				boardFileVO.setFileName(fileName);
				boardFileVO.setOriName(file.getOriginalFilename());
				boardFileVO.setBoard(1);
				int result = boardFileDAO.fileInsert(boardFileVO);
				System.out.println(result);
			}
		}
		 return noticeDAO.boardUpdate(boardVO); 
	}

	@Override
	public int boardDelete(long num) throws Exception {
		// TODO Auto-generated method stub
		return noticeDAO.boardDelete(num);
	}
}
