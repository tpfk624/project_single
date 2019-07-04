package com.kitri.single.hashtag.model;

public class HashtagDto {
	
	private int hashtagNum;
	private String hashtagContent;
	private int hashtagTypeNum;
	private Integer boardNum;
	private Integer groupNum;
	
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
	public Integer getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(Integer boardNum) {
		this.boardNum = boardNum;
	}
	public Integer getGroupNum() {
		return groupNum;
	}
	public void setGroupNum(Integer groupNum) {
		this.groupNum = groupNum;
	}
	@Override
	public String toString() {
		return "HashtagDto [hashtagNum=" + hashtagNum + ", hashtagContent=" + hashtagContent + ", hashtagTypeNum="
				+ hashtagTypeNum + ", boardNum=" + boardNum + ", groupNum=" + groupNum + "]";
	}
	
}
