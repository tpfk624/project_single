package com.kitri.single.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kitri.single.board.model.BoardDto;
import com.kitri.single.board.model.ReplyDto;

public interface ReplyService {
	
	// 답변 글들 보여주기
	List<ReplyDto> answerview(BoardDto boardDto);
	
}
