package com.kitri.single.board.dao;

import java.util.List;

import com.kitri.single.board.model.BoardDto;;


public interface BoardDao {

	int writeArticle(BoardDto boardDto);
	int writeArticlehashtag(String hashtag);
	
	BoardDto viewArticle(int boardNum);
	
}
