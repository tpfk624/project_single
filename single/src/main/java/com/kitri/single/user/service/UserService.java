package com.kitri.single.user.service;

import java.util.List;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.kitri.single.board.model.BoardDto;
import com.kitri.single.group.model.GroupDto;

import com.kitri.single.user.model.UserDto;

public interface UserService {

	//<내 정보부분>
	public UserDto userInfom(String id);//내 정보 가져오기
	public UserDto userModify(UserDto userDto); //내정보 수정 >> 아마도 제이슨으로 보내니까 
	public void userDelete(String id); //내정보 삭제 >> 얘를 삭제하면 모임에서 상태도 바뀜
	
	
	//<나의 모임부분>
	public List<GroupDto> getGroupAll(Map<String, String> parameter);//모임불러오기(전체보기)
	public List<GroupDto> getMyGroup(Map<String, String> parameter);//모임불러오기(모임장/모임원)
	public GroupDto getGroup(int groupNum);// 특정 그룹 자세한 정보 가져오기
	public void leaveGroup(Map<String, String> parameter); //나의 모임 탈퇴 >> 탈퇴 후 알려줄게 딱히 없으니 void 코드상태도 바꾸고 멤버딜리트도 해야함
	//방장 스티커 표시하기
	
	
	//<찜한 모임부분>
	public List<GroupDto> getStampGroup(Map<String, String> parameter); //찜그룹(전체) >> userid랑 카테고리를 분류해야해서  
	public List<GroupDto> getMyStamp(Map<String, String> parameter); //찜그룹(카테고리)
	public void stampDelete(Map<String, String> parameter); //찜한 그룹 삭제하기 >> userid랑 groupnum이 들어가야함 세션과 화면클릭을 통해
	public  String stampDelete(String userId, int groupNum);//카루뱅 찜한 그룹 삭제하기 >> userid랑 groupnum이 들어가야함 세션과 화면클릭을 통해

	
	//<게시물 관리>
	public List<BoardDto> getBoardAll(Map<String, String> parameter);//게시물 불러오기(전체보기)
	public List<BoardDto> getBoardOther(Map<String, String> parameter, String option);
	

	
	


	
	
	

	
	
	

}