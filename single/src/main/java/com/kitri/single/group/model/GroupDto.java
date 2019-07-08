package com.kitri.single.group.model;

import java.util.List;

public class GroupDto extends GroupCategoryDto{
	
	private int groupNum;
	private String groupName;
	private String groupDescription;
	private String groupImgSrc;
	private int groupMemberLimit;
	private int groupMemberCount;
	private String groupMainPlace;
	private String groupCreatedate;
	private String groupDeletedate;
	private int groupStatecode;
	private List<String> hashtagList;
	private GroupMemberDto groupMemberDto; 
	
	public int getGroupNum() {
		return groupNum;
	}
	public void setGroupNum(int groupNum) {
		this.groupNum = groupNum;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public String getGroupDescription() {
		return groupDescription;
	}
	public void setGroupDescription(String groupDescription) {
		this.groupDescription = groupDescription;
	}
	public String getGroupImgSrc() {
		return groupImgSrc;
	}
	public void setGroupImgSrc(String groupImgSrc) {
		this.groupImgSrc = groupImgSrc;
	}
	public int getGroupMemberLimit() {
		return groupMemberLimit;
	}
	public void setGroupMemberLimit(int groupMemberLimit) {
		this.groupMemberLimit = groupMemberLimit;
	}
	public String getGroupMainPlace() {
		return groupMainPlace;
	}
	public void setGroupMainPlace(String groupMainPlace) {
		this.groupMainPlace = groupMainPlace;
	}
	public String getGroupCreatedate() {
		return groupCreatedate;
	}
	public void setGroupCreatedate(String groupCreatedate) {
		this.groupCreatedate = groupCreatedate;
	}
	public String getGroupDeletedate() {
		return groupDeletedate;
	}
	public void setGroupDeletedate(String groupDeletedate) {
		this.groupDeletedate = groupDeletedate;
	}
	public int getGroupStatecode() {
		return groupStatecode;
	}
	public void setGroupStatecode(int groupStatecode) {
		this.groupStatecode = groupStatecode;
	}
	
	public int getGroupMemberCount() {
		return groupMemberCount;
	}
	public void setGroupMemberCount(int groupMemberCount) {
		this.groupMemberCount = groupMemberCount;
	}
	public List<String> getHashtagList() {
		return hashtagList;
	}
	public void setHashtagList(List<String> hashtagList) {
		this.hashtagList = hashtagList;
	}
	
	public GroupMemberDto getGroupMemberDto() {
		return groupMemberDto;
	}
	public void setGroupMemberDto(GroupMemberDto groupMemberDto) {
		this.groupMemberDto = groupMemberDto;
	}
	@Override
	public String toString() {
		return "GroupDto [groupNum=" + groupNum + ", groupName=" + groupName + ", groupDescription=" + groupDescription
				+ ", groupImgSrc=" + groupImgSrc + ", groupMemberLimit=" + groupMemberLimit + ", groupMemberCount="
				+ groupMemberCount + ", groupMainPlace=" + groupMainPlace + ", groupCreatedate=" + groupCreatedate
				+ ", groupDeletedate=" + groupDeletedate + ", groupStatecode=" + groupStatecode + ", hashtagList="
				+ hashtagList + ", groupMemberDto=" + groupMemberDto + ", getGroupCategoryNum()="
				+ getGroupCategoryNum() + ", getGroupCategoryName()=" + getGroupCategoryName() + "]";
	}
}
