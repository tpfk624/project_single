package com.kitri.single.dto;

public class ReplyDto {
	
	private int replyNum;
	private int boardNum;
	private String userId;
	private String userNickname;
	private String replyContent;
	private String replyCreatedate;
	
	public int getReplyNum() {
		return replyNum;
	}
	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
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
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public String getReplyCreatedate() {
		return replyCreatedate;
	}
	public void setReplyCreatedate(String replyCreatedate) {
		this.replyCreatedate = replyCreatedate;
	}
	
	@Override
	public String toString() {
		return "ReplyDto [replyNum=" + replyNum + ", boardNum=" + boardNum + ", userId=" + userId + ", userNickname="
				+ userNickname + ", replyContent=" + replyContent + ", replyCreatedate=" + replyCreatedate + "]";
	}
	
	
	
	
}
