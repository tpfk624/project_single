package com.kitri.single.board.dao;

import java.util.List;

import com.kitri.single.board.model.BoardDto;
import com.kitri.single.hashtag.dao.HashtagDao;;


public interface BoardDao extends HashtagDao{

	int writeArticle(BoardDto boardDto);
	
	// view
	BoardDto viewArticle(int boardNum);
	
	// viewMain 오늘의 새글
	
}
