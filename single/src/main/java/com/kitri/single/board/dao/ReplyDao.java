package com.kitri.single.board.dao;

import java.util.List;
import java.util.Map;

import com.kitri.single.board.model.BoardDto;
import com.kitri.single.board.model.ReplyDto;;

public interface ReplyDao {

	// 답변 글들 보여주기
	List<ReplyDto> answerView(BoardDto boardDto);
	
	// 답변 Insert하기
	public int answerInsert(ReplyDto replyDto);
	
	// 답변 Delete하기
	public int answerDelete(int replyNum);
	
	// 좋아요
	public int likeS(Map<String, Object> map);
	// 좋아요 Update
	public int likeU(int boardNum);
	// 좋아요 Insert
	public int likeI(Map<String, Object> map);
	
}
