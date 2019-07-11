package com.kitri.single.group.model;

import com.kitri.single.user.model.UserDto;

public class ChatDto {
	private int groupNum;
	private String userId;
	private String userNickname;
	private String chatTime;
	private String chatContent;
	
	public int getGroupNum() {
		return groupNum;
	}
	public void setGroupNum(int groupNum) {
		this.groupNum = groupNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getChatTime() {
		return chatTime;
	}
	public void setChatTime(String chatTime) {
		this.chatTime = chatTime;
	}
	public String getChatContent() {
		return chatContent;
	}
	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
	@Override
	public String toString() {
		return "ChatDto [groupNum=" + groupNum + ", userId=" + userId + ", chatTime=" + chatTime + ", chatContent="
				+ chatContent + "]";
	}
	
}
