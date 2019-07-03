package com.kitri.single.board.dao;

import com.kitri.single.board.model.BoardDto;;


public interface BoardDao {

	int writeArticle(BoardDto boardDto);
	int writeArticlehashtag(BoardDto boardDto);
	
	BoardDto viewArticle(int boardNum);
	
}
