package com.kitri.single.board.service;


import com.kitri.single.board.model.BoardDto;



public interface BoardService {
	
	int writeArticle(BoardDto boardDto);
	
	// 내 글 보기
	BoardDto viewArticle(int seq);

}
