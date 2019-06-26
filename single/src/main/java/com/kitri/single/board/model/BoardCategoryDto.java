package com.kitri.single.board.model;

public class BoardCategoryDto {

	private int categoryNum;
	private String categoryName;
	
	public int getCategoryNum() {
		return categoryNum;
	}
	public void setCategoryNum(int categoryNum) {
		this.categoryNum = categoryNum;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	@Override
	public String toString() {
		return "BoardCategoryDto [categoryNum=" + categoryNum + ", categoryName=" + categoryName + "]";
	}
	
	
}
