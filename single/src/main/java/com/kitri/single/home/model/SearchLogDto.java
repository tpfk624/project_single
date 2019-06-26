package com.kitri.single.home.model;

public class SearchLogDto {

	private int searchLogNum;
	private String userId;
	private String searchContent;
	private String searchDate;
	private String searchSite;
	
	public int getSearchLogNum() {
		return searchLogNum;
	}
	public void setSearchLogNum(int searchLogNum) {
		this.searchLogNum = searchLogNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getSearchContent() {
		return searchContent;
	}
	public void setSearchContent(String searchContent) {
		this.searchContent = searchContent;
	}
	public String getSearchDate() {
		return searchDate;
	}
	public void setSearchDate(String searchDate) {
		this.searchDate = searchDate;
	}
	public String getSearchSite() {
		return searchSite;
	}
	public void setSearchSite(String searchSite) {
		this.searchSite = searchSite;
	}
	
	@Override
	public String toString() {
		return "SearchLogDto [searchLogNum=" + searchLogNum + ", userId=" + userId + ", searchContent=" + searchContent
				+ ", searchDate=" + searchDate + ", searchSite=" + searchSite + "]";
	}
	
	
}
