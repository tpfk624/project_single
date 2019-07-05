package com.kitri.single.board.dao;

import java.util.List;
import java.util.Map;

import com.kitri.single.board.model.BoardDto;
import com.kitri.single.board.model.BoardPageDto;
import com.kitri.single.hashtag.dao.HashtagDao;;


public interface BoardDao extends HashtagDao{

	int writeArticle(BoardDto boardDto);
	
	// view
	BoardDto viewArticle(int boardNum);
	
	// totalPage
	int totalPage();
	
	// 메인 페이징 처리
	List<BoardDto> findByRows(BoardPageDto boardPageDto);
	
}
