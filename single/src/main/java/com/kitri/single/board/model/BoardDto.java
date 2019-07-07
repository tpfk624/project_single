package com.kitri.single.board.model;

import java.util.List;

public class BoardDto {

	private int boardNum;
	private int boardListNum;
	private String userId;
	private String userNickname;
	private String boardSubject;
	private String boardContent;
	private int boardViews;
	private int boardLike;
	private String boardCreatedate;
	private String boardUpdatedate;
	private String boardDeletedate;
	private String boardStatecode;
	private List<String> hashtagList;
	private List<BoardDto> list;
	
	
	
	public List<BoardDto> getList() {
		return list;
	}
	public void setList(List<BoardDto> list) {
		this.list = list;
	}
	public int getBoardLike() {
		return boardLike;
	}
	public void setBoardLike(int boardLike) {
		this.boardLike = boardLike;
	}
	public List<String> getHashtagList() {
		return hashtagList;
	}
	public void setHashtagList(List<String> hashtagList) {
		this.hashtagList = hashtagList;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public int getBoardListNum() {
		return boardListNum;
	}
	public void setBoardListNum(int boardListNum) {
		this.boardListNum = boardListNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
	public String getBoardSubject() {
		return boardSubject;
	}
	public void setBoardSubject(String boardSubject) {
		this.boardSubject = boardSubject;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public int getBoardViews() {
		return boardViews;
	}
	public void setBoardViews(int boardViews) {
		this.boardViews = boardViews;
	}
	public String getBoardCreatedate() {
		return boardCreatedate;
	}
	public void setBoardCreatedate(String boardCreatedate) {
		this.boardCreatedate = boardCreatedate;
	}
	public String getBoardUpdatedate() {
		return boardUpdatedate;
	}
	public void setBoardUpdatedate(String boardUpdatedate) {
		this.boardUpdatedate = boardUpdatedate;
	}
	public String getBoardDeletedate() {
		return boardDeletedate;
	}
	public void setBoardDeletedate(String boardDeletedate) {
		this.boardDeletedate = boardDeletedate;
	}
	public String getBoardStatecode() {
		return boardStatecode;
	}
	public void setBoardStatecode(String boardStatecode) {
		this.boardStatecode = boardStatecode;
	}
	
	
	
	
	
	@Override
	public String toString() {
		return "BoardDto [boardNum=" + boardNum + ", boardListNum=" + boardListNum + ", userId=" + userId
				+ ", userNickname=" + userNickname + ", boardSubject=" + boardSubject + ", boardContent=" + boardContent
				+ ", boardViews=" + boardViews + ", boardLike=" + boardLike + ", boardCreatedate=" + boardCreatedate
				+ ", boardUpdatedate=" + boardUpdatedate + ", boardDeletedate=" + boardDeletedate + ", boardStatecode="
				+ boardStatecode + ", hashtagList=" + hashtagList + ", list=" + list + "]";
	}
	
	
	
	

}











