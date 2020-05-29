package com.k2js.p1.manager;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.k2js.p1.board.BoardVO;
import com.k2js.p1.manager.file.ManagerFileDAO;
import com.k2js.p1.manager.file.ManagerFileVO;
import com.k2js.p1.util.FileSaver;
import com.k2js.p1.util.Pager;



@Service
public class ManagerService{

	@Autowired
	private ManagerDAO managerDAO;	
	@Autowired
	private ServletContext servletContext;
	@Autowired
	private FileSaver fileSaver;
	@Autowired
	private ManagerFileDAO managerFileDAO;
	
	public int addManager(ManagerVO managerVO, MultipartFile file) throws Exception {
		String path = servletContext.getRealPath("/resources/uploadmanager");
		
		//sequence 번호 받기
		managerVO.setNum(managerDAO.managerNum());
		int result = managerDAO.addManager(managerVO);
		
		ManagerFileVO managerFileVO = new ManagerFileVO();
		String fileName = fileSaver.saveByTransfer(file, path);
		managerFileVO.setNum(managerVO.getNum());
		managerFileVO.setFileName(fileName);
		managerFileVO.setOriName(file.getOriginalFilename());
		managerFileDAO.fileInsert(managerFileVO);
		
		return result;
	}
	
	public ManagerVO managerSelect(long num)throws Exception{
		return managerDAO.managerSelect(num);
	}
	
	public List<ManagerVO> managerList(Pager pager) throws Exception {
		pager.makeRow();
		long totalCount = managerDAO.managerCount(pager);
		pager.makePage(totalCount);
		
		return managerDAO.managerList(pager);
	}
	
	public int managerDelete(long number)throws Exception{
		return managerDAO.managerDelete(number);
		
	}
}
