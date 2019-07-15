package com.kitri.single.util;

import java.util.List;

public class Pagination<T> {
	private boolean nowFirst; // 현재 내 페이지가 앞인지
	private boolean nowEnd;  // 현재 내 페이지가 뒤인지
	private int totalPageCount;   //총 페이지수
	private int pageGroupSize; 	// 페이지그룹에 보여줄 페이지
	private String url;				//호출할 컨트롤러
	private int currentPage; 		//현재페이지
	private int totalListCount;   //모든 아이템의 수
	private int startPage;			//페이지 그룹에서 시작페이지
	private int endPage;			//페이지 그룹에서 마지막페이지
	private String key;		
	private String word;
	private List<T> list;		//데이터내역
	
	public void settingPagination(int pageGroupSize, int totalPageCount
			, int currentPage, int totalListCount) {
		this.pageGroupSize = pageGroupSize;
		this.totalPageCount = totalPageCount;
		this.currentPage = currentPage;
		this.totalListCount = totalListCount;
		
		int prePage = (currentPage - 1)/pageGroupSize * pageGroupSize;
		nowFirst = currentPage <= pageGroupSize;
		nowEnd = (totalPageCount - 1) / pageGroupSize * pageGroupSize < currentPage;
		
		startPage = prePage + 1;
		endPage = (prePage + pageGroupSize) >= totalPageCount ? totalPageCount : prePage + pageGroupSize;
	}
	
	public boolean isNowFirst() {
		return nowFirst;
	}
	public void setNowFirst(boolean nowFirst) {
		this.nowFirst = nowFirst;
	}
	public boolean isNowEnd() {
		return nowEnd;
	}
	public void setNowEnd(boolean nowEnd) {
		this.nowEnd = nowEnd;
	}
	public int getTotalPageCount() {
		return totalPageCount;
	}
	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}
	
	public int getPageGroupSize() {
		return pageGroupSize;
	}

	public void setPageGroupSize(int pageGroupSize) {
		this.pageGroupSize = pageGroupSize;
	}

	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	public int getTotalListCount() {
		return totalListCount;
	}

	public void setTotalListCount(int totalListCount) {
		this.totalListCount = totalListCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}
	

	@Override
	public String toString() {
		return "Pagination [nowFirst=" + nowFirst + ", nowEnd=" + nowEnd + ", totalPageCount=" + totalPageCount
				+ ", pageGroupSize=" + pageGroupSize + ", url=" + url + ", currentPage="
				+ currentPage + ", totalListCount=" + totalListCount + ", startPage=" + startPage + ", endPage="
				+ endPage + ", key=" + key + ", word=" + word + ", list=" + list + "]";
	}
}
