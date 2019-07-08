package com.kitri.single.board.service;


import java.util.List;

import com.kitri.single.board.model.BoardDto;
import com.kitri.single.board.model.BoardPageDto;



public interface BoardService {
	
	// board insert
	int writeArticle(BoardDto boardDto);
	
	// viewDetail
	BoardDto viewArticle(int boardNum);
	
	// selectNewList 오늘의 새글
	BoardPageDto selectBoardList(int currentPage, int boardListNum);
	
	// 메인 이주의 추천순
	List<BoardDto> weekList();
	
	
}
