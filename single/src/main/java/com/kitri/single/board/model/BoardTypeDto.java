package com.kitri.single.board.model;

public class BoardTypeDto {

	private int boardTypeNum;
	private String boardTypeName;
	
	public int getBoardTypeNum() {
		return boardTypeNum;
	}
	public void setBoardTypeNum(int boardTypeNum) {
		this.boardTypeNum = boardTypeNum;
	}
	public String getBoardTypeName() {
		return boardTypeName;
	}
	public void setBoardTypeName(String boardTypeName) {
		this.boardTypeName = boardTypeName;
	}
	
	@Override
	public String toString() {
		return "BoardTypeDto [boardTypeNum=" + boardTypeNum + ", boardTypeName=" + boardTypeName + "]";
	}
	
}
