package com.kitri.single.board.model;

public class ReplyDto extends BoardDto {
	
	private int replyNum;
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
		return "ReplyDto [replyNum=" + replyNum + ", userId=" + userId + ", userNickname="
				+ userNickname + ", replyContent=" + replyContent + ", replyCreatedate=" + replyCreatedate + "]";
	}
	
	
	
	
}
