package com.kitri.single.board.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.single.board.dao.ReplyDao;
import com.kitri.single.board.model.BoardDto;
import com.kitri.single.board.model.ReplyDto;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private SqlSession sqlSession;
	
	// 답변 글들 보여주기
	@Override
	public List<ReplyDto> answerview(BoardDto boardDto) {
		
		List<ReplyDto> answerList = sqlSession.getMapper(ReplyDao.class).answerview(boardDto);
		
		return answerList;
	}

	
	
}
