package com.k2js.p1.manager;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.k2js.p1.manager.file.ManagerFileDAO;
import com.k2js.p1.manager.file.ManagerFileVO;
import com.k2js.p1.util.FileSaver;



@Service
public class ManagerService {

	@Autowired
	private ManagerDAO managerDAO;	
	@Autowired
	private ServletContext servletContext;
	@Autowired
	private FileSaver fileSaver;
	@Autowired
	private ManagerFileDAO managerFileDAO;
	

	public int addManager(ManagerVO managerVO, MultipartFile [] files) throws Exception {
		// TODO Auto-generated method stub
		String path = servletContext.getRealPath("/resources/uploadmanager");
		System.out.println(path);
		
		//sequence 번호 받기
		managerVO.setNum(managerDAO.managerNum());
		//notice table insert
		int result = managerDAO.addManager(managerVO);
		
		for(MultipartFile file : files) {
			if(file.getSize()>0) {
				ManagerFileVO managerFileVO = new ManagerFileVO();
				String fileName = fileSaver.saveByTransfer(file, path);
				managerFileVO.setNum(managerVO.getNum());
				managerFileVO.setFileName(fileName);
				managerFileVO.setOriName(file.getOriginalFilename());
				managerFileDAO.fileInsert(managerFileVO);
			}
		}
		return result;
	}
}
