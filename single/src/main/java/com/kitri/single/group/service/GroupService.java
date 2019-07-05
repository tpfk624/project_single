package com.kitri.single.group.service;

import java.util.List;
import java.util.Map;

import com.kitri.single.group.model.GroupDto;
import com.kitri.single.group.model.GroupMemberDto;
import com.kitri.single.user.model.UserDto;

public interface GroupService {

	public List<GroupDto> getGroupList(Map<String, String> parameter);
	//특정 그룹 자세한 정보 가져오기
	public GroupDto getGroup(int groupNum);
	
	//그룹 전체 개수
	public int getGroupConunt(Map<String, String> parameter);
	
	//그룹 만들기
	public String createGroup(GroupDto groupDto, UserDto userInfo, String groupHashtag);
	public void insertGroupMember(GroupMemberDto groupMemberDto);
	
	
	public void increaseGroupMemberCount();
	public GroupMemberDto getGroupMember(Map<String, Object> parameter);
}
