package com.k2js.p1.board;

import java.util.List;

import com.k2js.p1.board.BoardVO;
import com.k2js.p1.util.Pager;

public interface BoardDAO {

	// count
	public long boardCount(Pager pager) throws Exception;

	// List
	public List<BoardVO> boardList(Pager pager) throws Exception;

	// select
	public BoardVO boardSelect(long num) throws Exception;

	// insert
	public int boardWrite(BoardVO boardVO) throws Exception;

	// delete
	public int boardDelete(long num) throws Exception;

	// update
	public int boardUpdate(BoardVO boardVO) throws Exception;
}
