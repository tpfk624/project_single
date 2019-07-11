package com.kitri.single.group.model;

import java.util.ArrayList;
import java.util.List;

public class HomeworkDto {
	private int homeworkNum;
	private int groupNum;
	private String homeworkSubject;
	private String homeworkContent;
	private String homeworkStartdate;
	private String homeworkEnddate;
	private String homeworkStatecode;
	private int progressBar;
	private String status;
	private List<HProgressDto> hProgressList;
	
	public HomeworkDto(){
		hProgressList = new ArrayList<HProgressDto>();
	}
	
	public int getHomeworkNum() {
		return homeworkNum;
	}
	public void setHomeworkNum(int homeworkNum) {
		this.homeworkNum = homeworkNum;
	}
	public int getGroupNum() {
		return groupNum;
	}
	public void setGroupNum(int groupNum) {
		this.groupNum = groupNum;
	}
	public String getHomeworkSubject() {
		return homeworkSubject;
	}
	public void setHomeworkSubject(String homeworkSubject) {
		this.homeworkSubject = homeworkSubject;
	}
	public String getHomeworkContent() {
		return homeworkContent;
	}
	public void setHomeworkContent(String homeworkContent) {
		this.homeworkContent = homeworkContent;
	}
	public String getHomeworkStartdate() {
		return homeworkStartdate;
	}
	public void setHomeworkStartdate(String homeworkStartdate) {
		this.homeworkStartdate = homeworkStartdate;
	}
	public String getHomeworkEnddate() {
		return homeworkEnddate;
	}
	public void setHomeworkEnddate(String homeworkEnddate) {
		this.homeworkEnddate = homeworkEnddate;
	}
	public String getHomeworkStatecode() {
		return homeworkStatecode;
	}
	public void setHomeworkStatecode(String homeworkStatecode) {
		this.homeworkStatecode = homeworkStatecode;
	}
	
	public List<HProgressDto> gethProgressList() {
		return hProgressList;
	}

	public void sethProgressList(List<HProgressDto> hProgressList) {
		this.hProgressList = hProgressList;
	}
	

	public int getProgressBar() {
		return progressBar;
	}

	public void setProgressBar(int progressBar) {
		this.progressBar = progressBar;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "HomeworkDto [homeworkNum=" + homeworkNum + ", groupNum=" + groupNum + ", homeworkSubject="
				+ homeworkSubject + ", homeworkContent=" + homeworkContent + ", homeworkStartdate=" + homeworkStartdate
				+ ", homeworkEnddate=" + homeworkEnddate + ", homeworkStatecode=" + homeworkStatecode + ", progressBar="
				+ progressBar + ", status=" + status + ", hProgressList=" + hProgressList + "]";
	}

}
