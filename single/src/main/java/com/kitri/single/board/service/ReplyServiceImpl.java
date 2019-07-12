package com.kitri.single.board.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kitri.single.board.dao.ReplyDao;
import com.kitri.single.board.model.BoardDto;
import com.kitri.single.board.model.ReplyDto;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private SqlSession sqlSession;
	
	// 답변 글들 보여주기
	@Override
	public List<ReplyDto> answerView(BoardDto boardDto) {
		
		List<ReplyDto> answerList = sqlSession.getMapper(ReplyDao.class).answerView(boardDto);
		
		return answerList;
	}

	
	// 답변 Insert하기
	@Override
	public int answerInsert(ReplyDto replyDto) {
		
		int seq = sqlSession.getMapper(ReplyDao.class).answerInsert(replyDto);
		
		return seq;
	}
	
	
	// 답변 Delete하기
	@Override
	public int answerDelete(int replyNum) {
		
		int seq = sqlSession.getMapper(ReplyDao.class).answerDelete(replyNum);
		
		return seq;
	}

	
	
	// 좋아요 하기
	@Override
	@Transactional
	public int like(Map<String, Object> map) {
		
		ReplyDao replyDao = sqlSession.getMapper(ReplyDao.class);
		
		// count 뽑아오기.
		int seq = replyDao.likeS(map);
		
		// 0이 아닐때 update하면 안뎀. 카운트로 뽑아와서 0일때만 업데이트
		if (seq != 0) {
			seq = 0;
		} else {
			
			int boardNum = (Integer)map.get("boardNum");
			
			// 업데이트
			seq = replyDao.likeU(boardNum);
			
			// 1일때 인설트하기
			if (seq != 0) {
				
				seq = replyDao.likeI(map);
				
				if (seq == 0) {
					seq = 0;
				}
				
			} else {
				seq = 0;
			}
		}
		
		
		return seq;
		
	}
	
	
	
	
	
}






