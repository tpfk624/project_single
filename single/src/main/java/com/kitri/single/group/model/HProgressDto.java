package com.kitri.single.group.model;

import com.kitri.single.user.model.UserDto;

public class HProgressDto extends UserDto{
	private int homeworkNum;
	private String userId;
	private int groupNum;
	private String hprogressSubject;
	private String hprogressContent;
	private String hprogressSuccess;
	private String hprogressSuccessStr;
	private String hprogressFile;
	private String hprogressFileOrigin;
	private String hprogressCreatedate;
	private String hprogressUpdatedate;
	
	public int getHomeworkNum() {
		return homeworkNum;
	}

	public void setHomeworkNum(int homeworkNum) {
		this.homeworkNum = homeworkNum;
	}
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getGroupNum() {
		return groupNum;
	}

	public void setGroupNum(int groupNum) {
		this.groupNum = groupNum;
	}

	public String getHprogressSubject() {
		return hprogressSubject;
	}

	public void setHprogressSubject(String hprogressSubject) {
		this.hprogressSubject = hprogressSubject;
	}

	public String getHprogressContent() {
		return hprogressContent;
	}

	public void setHprogressContent(String hprogressContent) {
		this.hprogressContent = hprogressContent;
	}

	public String getHprogressSuccess() {
		return hprogressSuccess;
	}
	
	public void setHprogressSuccess(String hprogressSuccess) {
		this.hprogressSuccess = hprogressSuccess;
	}
	
	public String getHprogressFile() {
		return hprogressFile;
	}

	public void setHprogressFile(String hprogressFile) {
		this.hprogressFile = hprogressFile;
	}
	public String getHprogressCreatedate() {
		return hprogressCreatedate;
	}

	public void setHprogressCreatedate(String hprogressCreatedate) {
		this.hprogressCreatedate = hprogressCreatedate;
	}

	public String getHprogressUpdatedate() {
		return hprogressUpdatedate;
	}

	public void setHprogressUpdatedate(String hprogressUpdatedate) {
		this.hprogressUpdatedate = hprogressUpdatedate;
	}
	
	public String getHprogressSuccessStr() {
		return hprogressSuccessStr;
	}

	public void setHprogressSuccessStr(String hprogressSuccessStr) {
		this.hprogressSuccessStr = hprogressSuccessStr;
	}
	public String getHprogressFileOrigin() {
		return hprogressFileOrigin;
	}

	public void setHprogressFileOrigin(String hprogressFileOrigin) {
		this.hprogressFileOrigin = hprogressFileOrigin;
	}

	@Override
	public String toString() {
		return "HProgressDto [homeworkNum=" + homeworkNum + ", userId=" + userId + ", groupNum=" + groupNum
				+ ", hprogressSubject=" + hprogressSubject + ", hprogressContent=" + hprogressContent
				+ ", hprogressSuccess=" + hprogressSuccess + ", hprogressSuccessStr=" + hprogressSuccessStr
				+ ", hprogressFile=" + hprogressFile + ", hprogressFileOrigin=" + hprogressFileOrigin
				+ ", hprogressCreatedate=" + hprogressCreatedate + ", hprogressUpdatedate=" + hprogressUpdatedate
				+ ", getUserNickname()=" + getUserNickname() + ", getUserName()=" + getUserName() + "]";
	}

}
