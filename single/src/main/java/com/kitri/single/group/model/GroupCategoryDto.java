package com.kitri.single.group.model;

public class GroupCategoryDto {
	private int groupCategoryNum;
	private String groupCategoryName;
	
	public int getGroupCategoryNum() {
		return groupCategoryNum;
	}
	public void setGroupCategoryNum(int groupCategoryNum) {
		this.groupCategoryNum = groupCategoryNum;
	}
	public String getGroupCategoryName() {
		return groupCategoryName;
	}
	public void setGroupCategoryName(String groupCategoryName) {
		this.groupCategoryName = groupCategoryName;
	}
	@Override
	public String toString() {
		return "GroupCategoryDto [groupCategoryNum=" + groupCategoryNum + ", groupCategoryName=" + groupCategoryName
				+ "]";
	}
}
