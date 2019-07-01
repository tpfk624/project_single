package com.kitri.single.board.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.single.board.model.BoardDto;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private SqlSession SqlSession;
	
	@Override
	public int writeArticle(BoardDto boardDto) {
		return 0;
	}

}
