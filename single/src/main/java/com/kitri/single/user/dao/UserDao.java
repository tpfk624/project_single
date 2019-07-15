package com.kitri.single.user.dao;

import java.util.List;

import java.util.Map;

import com.kitri.single.board.model.BoardDto;
import com.kitri.single.group.dao.GroupDao;
import com.kitri.single.group.model.GroupDto;
import com.kitri.single.group.model.GroupMemberDto;
import com.kitri.single.user.model.UserDto;

public interface UserDao {

	
	public UserDto userInfom(String id); // 내 정보 가져오기
	public void userModify(UserDto userDto); //비밀번호 유지 + 정보 수정 내정보 수정 >> 아마도 제이슨으로 보내니까 
	public void userModifynew(UserDto userDto); //비밀번호 변경 + 정보 수정
	public void userDelete(String id); 	// 내정보 삭제 >> 얘를 삭제하면 모임에서 상태도 바뀜
	
	
	//나의 모임관리
	public List<GroupDto> getGroupAll(Map<String, String> parameter);// 전체 조회
	public GroupDto getGroup(int groupNum);							// 하나만 조회
	public List<GroupDto> getMyGroup(Map<String, String> parameter);// 그룹개설 조회
	
	public void updateGroupMember(Map<String, Object> parameter);//탈퇴 (모임원탈퇴)
	public void groupMemberCountDown(int groupNum); //탈퇴 후 모임 카운트내리기	

	//찜모임관리
	public List<GroupDto> getStampGroup(Map<String, String> parameter);	//찜한 그룹 전체조회
	public List<GroupDto> getMyStamp(Map<String, String> parameter); //찜한 그룹 카테고리별
	public void stampDelete(Map<String, Object> parameter);//찜한 그룹 삭제
	
	//게시물관리
	public List<BoardDto> getBoardAll(Map<String, String> parameter);//내가 쓴 글 가져오기
	public List<BoardDto> getBoardOther(Map<String, String> parameter);
	public List<BoardDto> getBoardHeart(Map<String, String> parameter);

	

	

	
	


}