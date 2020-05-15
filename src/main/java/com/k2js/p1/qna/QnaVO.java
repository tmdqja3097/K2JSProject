package com.k2js.p1.qna;

import java.util.List;

import com.k2js.p1.board.BoardVO;
import com.k2js.p1.board.file.BoardFileVO;

public class QnaVO extends BoardVO{

	private List<BoardFileVO> boardFileVOs;

	public List<BoardFileVO> getBoardFileVOs() {
		return boardFileVOs;
	}

	public void setBoardFileVOs(List<BoardFileVO> boardFileVOs) {
		this.boardFileVOs = boardFileVOs;
	}
}
