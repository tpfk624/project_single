package com.kitri.single.board.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.single.board.dao.BoardDao;
import com.kitri.single.board.dao.ReplyDao;
import com.kitri.single.board.model.BoardDto;
import com.kitri.single.board.model.ReplyDto;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int writeArticle(BoardDto boardDto) {
		int cnt = sqlSession.getMapper(BoardDao.class).writeArticle(boardDto);
		return cnt != 0? boardDto.getBoardNum() : 0;
	}

}
