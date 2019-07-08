package com.kitri.single.group.model;

public class CalendarDto {
	private int calendarNum;
	private int groupNum;
	private String calendarSubject;
	private String calendarContent;
	private String calendarDate;
	private double calendarXLoc;
	private double calendarYLoc;
	
	public int getCalendarNum() {
		return calendarNum;
	}
	public void setCalendarNum(int calendarNum) {
		this.calendarNum = calendarNum;
	}
	public int getGroupNum() {
		return groupNum;
	}
	public void setGroupNum(int groupNum) {
		this.groupNum = groupNum;
	}
	public String getCalendarSubject() {
		return calendarSubject;
	}
	public void setCalendarSubject(String calendarSubject) {
		this.calendarSubject = calendarSubject;
	}
	public String getCalendarContent() {
		return calendarContent;
	}
	public void setCalendarContent(String calendarContent) {
		this.calendarContent = calendarContent;
	}
	public String getCalendarDate() {
		return calendarDate;
	}
	public void setCalendarDate(String calendarDate) {
		this.calendarDate = calendarDate;
	}
	public double getCalendarXLoc() {
		return calendarXLoc;
	}
	public void setCalendarXLoc(double calendarXLoc) {
		this.calendarXLoc = calendarXLoc;
	}
	public double getCalendarYLoc() {
		return calendarYLoc;
	}
	public void setCalendarYLoc(double calendarYLoc) {
		this.calendarYLoc = calendarYLoc;
	}
	@Override
	public String toString() {
		return "CalendarDto [calendarNum=" + calendarNum + ", groupNum=" + groupNum + ", calendarSubject="
				+ calendarSubject + ", calendarContent=" + calendarContent + ", calendarDate=" + calendarDate
				+ ", calendarXLoc=" + calendarXLoc + ", calendarYLoc=" + calendarYLoc + "]";
	}
	
	
}
