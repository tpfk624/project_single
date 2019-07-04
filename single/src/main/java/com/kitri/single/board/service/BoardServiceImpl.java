package com.kitri.single.board.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kitri.single.board.dao.BoardDao;
import com.kitri.single.board.model.BoardDto;
import com.kitri.single.common.dao.CommonDao;
import com.kitri.single.group.service.GroupServiceImpl;

@Service
public class BoardServiceImpl implements BoardService {
	
	//로그
	//private static final Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);
		
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	@Transactional
	public int writeArticle(BoardDto boardDto) {
		
		int boardNum = sqlSession.getMapper(CommonDao.class).getNextSeq();
		boardDto.setBoardNum(boardNum);
		int cnt = sqlSession.getMapper(BoardDao.class).writeArticle(boardDto);
		int cnthashtag = 0;
		List<String> hashtagList = boardDto.getHashtagList();
		for (int i = 0; i < hashtagList.size(); i++) {
			cnthashtag = sqlSession.getMapper(BoardDao.class).writeArticlehashtag(hashtagList.get(i));
		}
		
		return cnt != 0? boardDto.getBoardNum() : 0;
		
	}
	
	@Override
//	@Transactional //알아서 트랜잭션해줌 root에서 관리.
	public BoardDto viewArticle(int boardNum) {
//		sqlSession.getMapper(CommonDao.class).updateHit(seq); // mapper_common 마이바티스 설정해주기
		BoardDto boardDto = sqlSession.getMapper(BoardDao.class).viewArticle(boardNum);
//		// 엔터키 적용해서 보내기.
//		reboardDto.setContent(reboardDto.getContent().replace("\n", "<br>"));
		return boardDto;
	}

}



















