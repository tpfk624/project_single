package com.kitri.single.user.dao;

import java.util.List;

import java.util.Map;

import com.kitri.single.group.model.GroupDto;

import com.kitri.single.user.model.UserDto;

public interface UserDao {

	
	public List<GroupDto> getGroupAll(Map<String, String> parameter);// 전체 조회
	public GroupDto getGroup(int groupNum);							// 하나만 조회
	public List<GroupDto> getMyGroup(Map<String, String> parameter);// 그룹개설 조회

	// 탈퇴
	// 방장탈퇴와 모임원탈퇴로 나뉜다


	//public List<GroupDto> getStampGroup(String userId);
	public List<GroupDto> getStampGroup(Map<String, String> parameter);	// 찜한 그룹
	public List<GroupDto> getMyStamp(Map<String, String> parameter);

	// 찜한 그룹 삭제
	public void stampDelete(Map<String, String> parameter);

	// 내 정보 가져오기
	public UserDto userInfom(String userId);

	// 내정보 수정
	public void userModify(UserDto userDto); // 아마도 제이슨으로 보내니까

	// 내정보 삭제
	public void userDelete(String userId); // 얘를 삭제하면 모임에서 상태도 바뀜


}