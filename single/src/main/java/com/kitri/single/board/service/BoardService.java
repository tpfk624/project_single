package com.kitri.single.board.service;


import java.util.List;

import com.kitri.single.board.model.BoardDto;
import com.kitri.single.board.model.BoardPageDto;
import com.kitri.single.user.model.UserDto;


 
public interface BoardService {
	
	// board insert
	int writeArticle(BoardDto boardDto);
	
	// viewDetail
	BoardDto viewArticle(int boardNum);
	
	// selectNewList 오늘의 새글
	BoardPageDto selectBoardList(int currentPage, int boardListNum, String key, String word);
	
	// 메인 이주의 추천순
	List<BoardDto> monthList();
	
	// 랭킹 유저 3명
	List<UserDto> rankingUser();
	
	// 랭킹 유저 3명의 글 리스트
	List<BoardDto> rankingboard(String userId);

	
}
