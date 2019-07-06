package com.kitri.single.board.service;


import com.kitri.single.board.model.BoardDto;
import com.kitri.single.board.model.BoardPageDto;



public interface BoardService {
	
	// board insert
	int writeArticle(BoardDto boardDto);
	
	// viewDetail
	BoardDto viewArticle(int boardNum);
	
	// selectNewList 오늘의 새글
	BoardPageDto selectNewList(int cp);
	
}
