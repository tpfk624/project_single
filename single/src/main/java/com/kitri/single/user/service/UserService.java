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
	
	
	//방장 스티커 표시하기
	
	
	//나의 모임 탈퇴
	public void leaveGroup(Map<String, String> parameter); //탈퇴 후 알려줄게 딱히 없으니 void 코드상태도 바꾸고 멤버딜리트도 해야함
	
	
	//찜한 그룹 정보 가져오기
	public List<GroupDto> getStampGroup(Map<String, String> parameter); //userid랑 카테고리를 분류해야해서  
	
	//찜한 그룹 삭제하기
	public void stampDelete(Map<String, String> parameter); //userid랑 groupnum이 들어가야함 세션과 화면클릭을 통해
	
	
	//내 정보 가져오기
	public UserDto userInfom(String userId);
	
	//내정보 수정
	public void userModify(UserDto userDto); //아마도 제이슨으로 보내니까 
	
	//내정보 삭제
	public void userDelete(String userId); //얘를 삭제하면 모임에서 상태도 바뀜
	
	
	

	
	
	

}