package com.kitri.single.board.model;

public class LikeDto {

	private int likeNum;
	private int boardNum;
	private String userId;
	
	public int getLikeNum() {
		return likeNum;
	}
	public void setLikeNum(int likeNum) {
		this.likeNum = likeNum;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	@Override
	public String toString() {
		return "LikeDto [likeNum=" + likeNum + ", boardNum=" + boardNum + ", userId=" + userId + "]";
	}
	
	
	
}
