package com.kitri.single.board.dao;

import java.util.List;
import java.util.Map;

import com.kitri.single.board.model.ReplyDto;;

public interface ReplyDao {

	int writeArticle(ReplyDto reboardDto);
	List<ReplyDto> listArticle(Map<String, String> parameter);
	ReplyDto viewArticle(int seq);
	int modifyArticle(ReplyDto reboardDto);
	void deleteArticle(int seq);
	
	//댓글
	void updateStep(ReplyDto reboardDto); // 2개 보냄
	int replyArticle(ReplyDto reboardDto);
	void updateReply(int pseq);
	
}
