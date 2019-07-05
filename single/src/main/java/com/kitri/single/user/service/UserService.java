package com.kitri.single.user.service;

import java.util.List;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.kitri.single.group.model.GroupDto;

import com.kitri.single.user.model.UserDto;

public interface UserService {

	// 초기 그룹 리스트 셀렉트

	public List<GroupDto> getGroupAll(Map<String, String> parameter);

	// 특정 그룹 자세한 정보 가져오기

	public String getGroupDetail(int groupNum);

	public List<GroupDto> getGroupMember(Map<String, String> parameter);

	public List<GroupDto> getGroupLeader(Map<String, String> parameter);

	public List<GroupDto> getMyGroup(Map<String, String> parameter);

}