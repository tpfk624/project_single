package com.kitri.single.dto;

public class BoardListDto  {
	
	private int boardListNum;
	private String boardName;
	private int boardTypeNum;
	private int boardCategoryNum;
	
	public int getBoardListNum() {
		return boardListNum;
	}
	public void setBoardListNum(int boardListNum) {
		this.boardListNum = boardListNum;
	}
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	public int getBoardTypeNum() {
		return boardTypeNum;
	}
	public void setBoardTypeNum(int boardTypeNum) {
		this.boardTypeNum = boardTypeNum;
	}
	public int getBoardCategoryNum() {
		return boardCategoryNum;
	}
	public void setBoardCategoryNum(int boardCategoryNum) {
		this.boardCategoryNum = boardCategoryNum;
	}
	
	@Override
	public String toString() {
		return "BoardListDto [boardListNum=" + boardListNum + ", boardName=" + boardName + ", boardTypeNum="
				+ boardTypeNum + ", boardCategoryNum=" + boardCategoryNum + "]";
	}
}
