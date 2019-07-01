package com.kitri.single.board.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.single.board.dao.ReplyDao;
import com.kitri.single.board.model.ReplyDto;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int writeArticle(ReplyDto replyDto) {
		int cnt = sqlSession.getMapper(ReplyDao.class).writeArticle(replyDto);
		return cnt != 0? replyDto.getBoardNum() : 0;
	}

	@Override
	public List<ReplyDto> listArticle(Map<String, String> parameter) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ReplyDto viewArticle(int seq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int modifyArticle(ReplyDto reboardDto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void deleteArticle(int seq) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateStep(ReplyDto reboardDto) {
		// TODO Auto-generated method stub

	}

	@Override
	public int replyArticle(ReplyDto reboardDto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateReply(int pseq) {
		// TODO Auto-generated method stub

	}

}
