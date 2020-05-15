package com.k2js.p1.notice;

import java.util.List;

import com.k2js.p1.board.file.BoardFileVO;
import com.k2js.p1.board.BoardVO;

public class NoticeVO extends BoardVO{

	private List<BoardFileVO> boardFileVOs;

	public List<BoardFileVO> getBoardFileVOs() {
		return boardFileVOs;
	}

	public void setBoardFileVOs(List<BoardFileVO> boardFileVOs) {
		this.boardFileVOs = boardFileVOs;
	}
}
