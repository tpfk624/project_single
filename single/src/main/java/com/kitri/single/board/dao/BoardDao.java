package com.kitri.single.board.dao;

import java.util.List;
import java.util.Map;

import com.kitri.single.board.model.BoardDto;
import com.kitri.single.board.model.BoardPageDto;
import com.kitri.single.hashtag.dao.HashtagDao;
import com.kitri.single.user.model.UserDto;;


public interface BoardDao extends HashtagDao{

	// 글쓰기
	int writeArticle(BoardDto boardDto);
	
	// view
	BoardDto viewArticle(int boardNum);
	
	// totalPage
	int totalPage(BoardPageDto boardPageDto);

	// 페이징 처리
	List<BoardDto> findByRows(BoardPageDto boardPageDto);
	
	// 메인 이주의 추천순
	List<BoardDto> monthList();
	
	// 검색
	List<BoardDto> search(String search);
	
	// 랭킹 유저 3명 검색
	List<UserDto> rankingUsers();
	
	// 랭킹 유저 3명의 글 리스트
	List<BoardDto> rankingBoards(String userId);
	
	
}
