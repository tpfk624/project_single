package com.kitri.single.board.service;


import java.util.List;

import com.kitri.single.board.model.BoardDto;



public interface BoardService {
	
	// board insert
	int writeArticle(BoardDto boardDto);
	
	// viewDetail
	BoardDto viewArticle(int boardNum);
	
	// viewMain 오늘의 새글
	
}
