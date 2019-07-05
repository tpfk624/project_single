package com.kitri.single.user.dao;

 

import java.util.List;

import java.util.Map;

 

import com.kitri.single.group.model.GroupDto;

import com.kitri.single.user.model.UserDto;

 

public interface UserDao {

	void create(UserDto userDto);

 

	int regist(UserDto userDto);

 

	// 전체 조회

	public List<GroupDto> getGroupAll(Map<String, String> parameter);

 

	// 하나만 조회

	public GroupDto getGroup(int groupNum);

 

	//그룹개설 조회

	List<GroupDto> getGroupMember(Map<String, String> parameter);

	

	List<GroupDto> getGroupLeader(Map<String, String> parameter);

	public List<GroupDto> getMyGroup(Map<String, String> parameter);

	

 

	

}