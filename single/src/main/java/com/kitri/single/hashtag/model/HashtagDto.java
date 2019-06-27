package com.kitri.single.hashtag.model;

public class HashtagDto {
	
	private int hashtagNum;
	private String hashtagContent;
	private int hashtagTypeNum;
	private int boardNum;
	private int groupNum;
	
	public int getHashtagNum() {
		return hashtagNum;
	}
	public void setHashtagNum(int hashtagNum) {
		this.hashtagNum = hashtagNum;
	}
	public String getHashtagContent() {
		return hashtagContent;
	}
	public void setHashtagContent(String hashtagContent) {
		this.hashtagContent = hashtagContent;
	}
	public int getHashtagTypeNum() {
		return hashtagTypeNum;
	}
	public void setHashtagTypeNum(int hashtagTypeNum) {
		this.hashtagTypeNum = hashtagTypeNum;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public int getGroupNum() {
		return groupNum;
	}
	public void setGroupNum(int groupNum) {
		this.groupNum = groupNum;
	}
	
	@Override
	public String toString() {
		return "HashtagDto [hashtagNum=" + hashtagNum + ", hashtagContent=" + hashtagContent + ", hashtagTypeNum="
				+ hashtagTypeNum + ", boardNum=" + boardNum + ", groupNum=" + groupNum + "]";
	}
	
	
	
}
