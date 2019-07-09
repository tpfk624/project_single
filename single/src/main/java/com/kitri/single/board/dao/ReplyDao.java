package com.kitri.single.board.dao;

import java.util.List;
import java.util.Map;

import com.kitri.single.board.model.BoardDto;
import com.kitri.single.board.model.ReplyDto;;

public interface ReplyDao {

	// 답변 글들 보여주기
	List<ReplyDto> answerview(BoardDto boardDto);
	
}
