package com.kitri.single.board.service;

import org.springframework.stereotype.Service;

import com.kitri.single.board.model.BoardDto;


@Service
public interface BoardService {
	
	int writeArticle(BoardDto boardDto);

}
