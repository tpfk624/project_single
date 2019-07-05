package com.kitri.single.group.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;

import com.kitri.single.group.model.GroupDto;
import com.kitri.single.group.model.GroupMemberDto;
import com.kitri.single.user.model.UserDto;


public interface GroupDao {
	
	//그룹 개수 조회
	public int getGroupConunt(Map<String, String> parameter);
	
	//전체 조회
	public List<GroupDto> getGroupList(Map<String, String> parameter);
	
	//하나만 조회
	public GroupDto getGroup(int groupNum);
	
	//hashtag 가져오기
	public List<String> getHashList(int groupNum);

	//그룹 만들기
	public int selectGroupNumSeq();
	public int insertGroup(GroupDto groupDto);
	public void insertGroupMember(GroupMemberDto groupMemberDto);
	
	public void updateGroupMemberCount();
	
	
	//그룹멤버 
	public GroupMemberDto selectGroupMember(Map<String, Object> parameter);
	
}	
