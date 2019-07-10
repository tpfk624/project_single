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

}
