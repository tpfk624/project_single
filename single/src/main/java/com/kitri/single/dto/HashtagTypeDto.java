package com.kitri.single.dto;

public class HashtagTypeDto {

	private int hashtagTypeNum;
	private String hashtagTypeName;
	
	public int getHashtagTypeNum() {
		return hashtagTypeNum;
	}
	public void setHashtagTypeNum(int hashtagTypeNum) {
		this.hashtagTypeNum = hashtagTypeNum;
	}
	public String getHashtagTypeName() {
		return hashtagTypeName;
	}
	public void setHashtagTypeName(String hashtagTypeName) {
		this.hashtagTypeName = hashtagTypeName;
	}
	
	@Override
	public String toString() {
		return "HashtagTypeDto [hashtagTypeNum=" + hashtagTypeNum + ", hashtagTypeName=" + hashtagTypeName + "]";
	}
	
	
}
