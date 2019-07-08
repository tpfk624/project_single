package com.kitri.single.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kitri.single.board.dao.BoardDao;
import com.kitri.single.board.model.BoardDto;
import com.kitri.single.board.model.BoardPageDto;
import com.kitri.single.common.dao.CommonDao;
import com.kitri.single.hashtag.dao.HashtagDao;
import com.kitri.single.hashtag.model.HashtagDto;

@Service
public class BoardServiceImpl implements BoardService {
	
	//로그
	//private static final Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);
		
	
	@Autowired
	private SqlSession sqlSession;
	
	
	
	// 글쓰기 ----------------------------------------------------------------
	@Override
	@Transactional
	public int writeArticle(BoardDto boardDto) {
		
		// boardNum로 글번호 증가( 시퀀스 글번호를 증가시키고 그 글번호를 가져옴 )
		// select 값을 저절로 반환 됨.
		
		int boardNum = sqlSession.getMapper(CommonDao.class).getNextSeq();
		
		// 글번호 증가한것을 dto에 추가해주고 글 작성
		boardDto.setBoardNum(boardNum);
		BoardDao boardDao = (BoardDao)sqlSession.getMapper(BoardDao.class);
		int cnt = boardDao.writeArticle(boardDto);
		
		// 해쉬태그 DB Insert
		int cnthashtag = 0;
		List<String> hashtagList = boardDto.getHashtagList();
		for (int i = 0; i < hashtagList.size(); i++) {
			HashtagDto hashtagDto = new HashtagDto();
			hashtagDto.setHashtagTypeNum(1);
			hashtagDto.setHashtagContent(hashtagList.get(i));
			hashtagDto.setBoardNum(boardDto.getBoardNum());
			boardDao.insertHashtag(hashtagDto);
		}
		
		return cnt != 0? boardDto.getBoardNum() : 0;
		
	}
	
	
	// 상세글보기 ----------------------------------------------------------------
	@Override
//	@Transactional //알아서 트랜잭션해줌 root에서 관리.
	public BoardDto viewArticle(int boardNum) {
//		sqlSession.getMapper(CommonDao.class).updateHit(seq); // mapper_common 마이바티스 설정해주기
		
		// 글번호의 글들을 dto에 담음
		BoardDto boardDto = sqlSession.getMapper(BoardDao.class).viewArticle(boardNum);
		
		// map에 type번호랑 글번호 put하기
		Map<String, Integer> parameter = new HashMap<String, Integer>();
		parameter.put("tagType", 1);
		parameter.put("boardNum", boardNum);
		
		// map을 dao로 보내주고 해쉬태그 리스트를 가져옴.
		List<String> hashtagList = sqlSession.getMapper(HashtagDao.class).getHashtagList(parameter);
		boardDto.setHashtagList(hashtagList);
		
//		// 엔터키 적용해서 보내기.
//		reboardDto.setContent(reboardDto.getContent().replace("\n", "<br>"));
		return boardDto;
	}

	
	// 메인페이지 페이징 처리 ----------------------------------------------------------------
	public BoardPageDto selectBoardList(int currentPage, int boardListNum, String key, String word) {
		
		BoardDto boardDto = new BoardDto();
		boardDto.setBoardListNum(boardListNum);
		
		int totalcnt = sqlSession.getMapper(BoardDao.class).totalPage(boardDto);
		
		
		int cntPerPage = 0; // 페이지별 보여줄 목록수
		int cntPerPageGroup = 0;
		
		if (boardListNum == 0) {
			cntPerPage = 5;
			cntPerPageGroup = 5;
		} else {
			cntPerPage = 8;
			cntPerPageGroup = 5;
		}

		
		BoardPageDto bp = new BoardPageDto(cntPerPage, totalcnt, cntPerPageGroup, currentPage, key, word);
		
		List<BoardDto> list = sqlSession.getMapper(BoardDao.class).findByRows(bp);
		//System.out.println(list.toString());
		
		bp.setList(list);
		
		return bp;
	}
	
	
	
	
	// 메인 이주의 추천순 ----------------------------------------------------------------
	public List<BoardDto> weekList() {
		
		List<BoardDto> boardDtoList = sqlSession.getMapper(BoardDao.class).weekList();
		
		return boardDtoList;
	}
	
	

}



















