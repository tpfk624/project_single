package com.kitri.single.group.model;

import com.kitri.single.user.model.UserDto;

public class GroupMemberDto extends UserDto{
	private int groupNum;
	private String userId;
	private String groupMemberStatecode;
	private String groupJoindate;
	private String groupRequestdate;
	
	public int getGroupNum() {
		return groupNum;
	}
	public void setGroupNum(int groupNum) {
		this.groupNum = groupNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getGroupMemberStatecode() {
		return groupMemberStatecode;
	}
	public void setGroupMemberStatecode(String groupMemberStatecode) {
		this.groupMemberStatecode = groupMemberStatecode;
	}
	public String getGroupJoindate() {
		return groupJoindate;
	}
	public void setGroupJoindate(String groupJoindate) {
		this.groupJoindate = groupJoindate;
	}
	public String getGroupRequestdate() {
		return groupRequestdate;
	}
	public void setGroupRequestdate(String groupRequestdate) {
		this.groupRequestdate = groupRequestdate;
	}
	
	@Override
	public String toString() {
		return "GroupMemberDto [groupNum=" + groupNum + ", userId=" + userId + ", groupMemberStatecode="
				+ groupMemberStatecode + ", groupJoindate=" + groupJoindate + ", groupRequestdate=" + groupRequestdate
				+ "]";
	}
}
