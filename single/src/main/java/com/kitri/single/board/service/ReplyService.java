package com.kitri.single.board.service;

import java.util.List;
import java.util.Map;

import com.kitri.single.board.model.ReplyDto;

public interface ReplyService {

	int writeArticle(ReplyDto replyDto);
	List<ReplyDto> listArticle(Map<String, String> parameter);
	ReplyDto viewArticle(int seq);
	int modifyArticle(ReplyDto reboardDto);
	void deleteArticle(int seq);
	
	//댓글
	void updateStep(ReplyDto reboardDto); // 2개 보냄
	int replyArticle(ReplyDto reboardDto);
	void updateReply(int pseq);
	
}
