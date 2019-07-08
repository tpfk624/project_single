package com.kitri.single.group.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;

import com.kitri.single.group.model.CalendarDto;
import com.kitri.single.group.model.GroupDto;
import com.kitri.single.group.model.GroupMemberDto;
import com.kitri.single.hashtag.dao.HashtagDao;
import com.kitri.single.user.model.UserDto;


public interface GroupDao extends HashtagDao{
	
	//그룹관련
	public int getGroupConunt(Map<String, String> parameter);
	public List<GroupDto> getGroupList(Map<String, String> parameter);
	public GroupDto getGroup(int groupNum);
	public int selectGroupNumSeq();
	public int insertGroup(GroupDto groupDto);
	public void updateGroup(GroupDto groupDto);
		
	//hashtag 가져오기
	public List<String> getHashList(int groupNum);
	public void deleteHashtag(Map<String, Object> parameter);

	//그룹 멤버
	public void insertGroupMember(GroupMemberDto groupMemberDto);
	public GroupMemberDto selectGroupMember(Map<String, Object> parameter);
	public List<GroupMemberDto> getGroupMemberList(int groupNum);
		
	//그룹 일정
	public int selectCalendarSeq();
	public void insertCalendar(CalendarDto calendarDto);
	public CalendarDto selectCalendar(Map<String, String> parameter);
	public List<CalendarDto> selectCalendarList(Map<String, String> parameter);
	public void updateCalendar(CalendarDto calendarDto);
	public void deleteCalendar(int calendarNum);

	//그룹 찜하기
	public void insertGroupStamp(Map<String, Object> parameter);
	public int countGroupStamp(Map<String, Object> parameter);
	
	
}	
