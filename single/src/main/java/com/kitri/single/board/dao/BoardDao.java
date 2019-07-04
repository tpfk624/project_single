package com.kitri.single.board.dao;

import java.util.List;

import com.kitri.single.board.model.BoardDto;;


public interface BoardDao {

	int writeArticle(BoardDto boardDto);
	
	// view
	BoardDto viewArticle(int boardNum);
	
	// viewMain 오늘의 새글
	
}
