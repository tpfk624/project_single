package com.kitri.single.group.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kitri.single.group.dao.GroupDao;
import com.kitri.single.group.model.CalendarDto;
import com.kitri.single.group.model.GroupDto;
import com.kitri.single.group.model.GroupMemberDto;
import com.kitri.single.hashtag.dao.HashtagDao;
import com.kitri.single.hashtag.model.HashtagDto;
import com.kitri.single.user.model.UserDto;
import com.kitri.single.util.SiteConstance;

@Service
public class GroupServiceImpl implements GroupService {
	
	@Autowired
	private SqlSession sqlSession;
	
	//로그
	private static final Logger logger = LoggerFactory.getLogger(GroupServiceImpl.class);
	
	@Override
	public List<GroupDto> getGroupList(Map<String, String> parameter) {
		int page = Integer.parseInt(parameter.get("page"));
		int groupSize = SiteConstance.GROUP_SIZE;
				
		int endRow = page * groupSize;
		int startRow = endRow - groupSize;
		
		parameter.put("endRow", endRow + "");
		parameter.put("startRow", startRow + "");
		
		//System.out.println(parameter);
		List<GroupDto> list = sqlSession.getMapper(GroupDao.class).getGroupList(parameter);
		//System.out.println(list);
		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = new JSONArray(list);
		jsonObject.put("groupList", jsonArray);
		return list;
	}

	@Override
	@Transactional
	public GroupDto getGroup(int groupNum) {
		//그룹 정보 가져오기
		GroupDto groupDto = sqlSession.getMapper(GroupDao.class).getGroup(groupNum);
		
		
		if(groupDto != null) {
			//해시태그 정보
			Map<String, Integer> parameter = new HashMap<String, Integer>();
			parameter.put("tagType", 2);
			parameter.put("groupNum", groupNum);
			List<String> tagList = sqlSession.getMapper(HashtagDao.class).getHashtagList(parameter);
			groupDto.setHashtagList(tagList);
			groupDto.getGroupDescription().replaceAll("\n", "<br>");
		}
		
		return groupDto;
	}

	@Override
	@Transactional
	public String createGroup(GroupDto groupDto, UserDto userInfo, String groupHashtag) {
		GroupDao groupDao = (GroupDao)sqlSession.getMapper(GroupDao.class);
		int groupNum = groupDao.selectGroupNumSeq();
		groupDto.setGroupNum(groupNum);
		groupNum = groupDao.insertGroup(groupDto);
		
		String[] hashtags = null;
		List<String> hashtagList = new ArrayList<String>();
		if(groupHashtag != null) {
			hashtags = groupHashtag.split("#");
			for(int i=0; i<hashtags.length ; i++) {
				if(hashtags[i] != null && hashtags[i].length() != 0) {
					hashtagList.add(hashtags[i].trim());
				}
			}
			for(int i=0 ; i<hashtagList.size(); i++) {
				HashtagDto hashtagDto = new HashtagDto();
				hashtagDto.setHashtagContent(hashtagList.get(i));
				hashtagDto.setHashtagTypeNum(2);
				hashtagDto.setGroupNum(groupDto.getGroupNum());
				groupDao.insertHashtag(hashtagDto);
			}
		}
		
		GroupMemberDto groupMemberDto = new GroupMemberDto();
		groupMemberDto.setGroupNum(groupDto.getGroupNum());
		groupMemberDto.setUserId(userInfo.getUserId());
		groupMemberDto.setGroupMemberStatecode("L");
		System.out.println(groupMemberDto);
		groupDao.insertGroupMember(groupMemberDto);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("groupNum", (groupNum != 0 ? groupDto.getGroupNum() : 0));
		
		return jsonObject.toString();
	}

	@Override
	public void insertGroupMember(GroupMemberDto groupMemberDto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void increaseGroupMemberCount() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public GroupMemberDto getGroupMember(Map<String, Object> parameter) {
		return sqlSession.getMapper(GroupDao.class).selectGroupMember(parameter);
	}


	@Override
	public int getGroupConunt(Map<String, String> parameter) {
		return sqlSession.getMapper(GroupDao.class).getGroupConunt(parameter);
	}

	@Override
	public String createCalendar(CalendarDto calendarDto) {
		GroupDao groupDao = (GroupDao)sqlSession.getMapper(GroupDao.class);
		int calendarNum = groupDao.selectCalendarSeq();
		calendarDto.setCalendarNum(calendarNum);
		
		groupDao.insertCalendar(calendarDto);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("resultCode", 1);
		JSONObject calendarJSON = new JSONObject(calendarDto);
		jsonObject.put("resultData", calendarJSON);
		
		return jsonObject.toString();
	}

	@Override
	public String getCalendar(Map<String, String> parameter) {
		
		CalendarDto calendarDto = sqlSession.getMapper(GroupDao.class).selectCalendar(parameter);
		JSONObject jsonObject = new JSONObject();
		
		jsonObject.put("resultCode", 1);
		jsonObject.put("resultData", new JSONObject(calendarDto));
		
		return jsonObject.toString();
	}
	
	@Override
	public String getCalendarList(Map<String, String> parameter) {
		List<CalendarDto> list = sqlSession.getMapper(GroupDao.class).selectCalendarList(parameter);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("resultCode", 1);
		jsonObject.put("resultData", new JSONArray(list));
		
		return jsonObject.toString();
	}
	@Override
	public String modifyCalendar(CalendarDto calendarDto) {
		sqlSession.getMapper(GroupDao.class).updateCalendar(calendarDto);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("resultCode", 2);
		jsonObject.put("resultData", new JSONObject(calendarDto));
		return jsonObject.toString();
	}
	
	@Override
	public String deleteCalendar(CalendarDto calendarDto) {
		sqlSession.getMapper(GroupDao.class).deleteCalendar(calendarDto.getCalendarNum());
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("resultCode", 3);
		jsonObject.put("resultData", new JSONObject(calendarDto));
		return jsonObject.toString();
	}
	
	@Override
	@Transactional
	public String groupModify(GroupDto groupDto, String groupHashtag) {
		
		GroupDao groupDao = sqlSession.getMapper(GroupDao.class);
		
		//해시태그 삭제
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("hashtagTypeNum", 2);
		parameter.put("groupNum", groupDto.getGroupNum());
		groupDao.deleteHashtag(parameter);
		
		//해시태그 인설트
		String[] hashtags = null;
		List<String> hashtagList = new ArrayList<String>();
		if(groupHashtag != null) {
			hashtags = groupHashtag.split("#");
			for(int i=0; i<hashtags.length ; i++) {
				if(hashtags[i] != null && hashtags[i].length() != 0) {
					hashtagList.add(hashtags[i].trim());
				}
			}
			for(int i=0 ; i<hashtagList.size(); i++) {
				HashtagDto hashtagDto = new HashtagDto();
				hashtagDto.setHashtagContent(hashtagList.get(i));
				hashtagDto.setHashtagTypeNum(2);
				hashtagDto.setGroupNum(groupDto.getGroupNum());
				groupDao.insertHashtag(hashtagDto);
			}
		}
		//그룹 업데이트
		groupDao.updateGroup(groupDto);

		return makeJSON(1, groupDto);
	}
	
	@Override
	@Transactional
	public String groupStamp(String userId, int groupNum) {
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("userId", userId);
		parameter.put("groupNum", groupNum);
		GroupDao groupDao = sqlSession.getMapper(GroupDao.class);
		if(groupDao.countGroupStamp(parameter) == 0) {
			groupDao.insertGroupStamp(parameter);
		}else {
			return makeJSON(2, "이미 찜한 모임입니다");
		}
		
		return makeJSON(1, "모임을 찜했습니다. 나의 찜목록 페이지에서 확인하세요");
	}
	
	@Override
	public String groupMember(Map<String, String> parameter) {
		String type = parameter.get("type");
		String json = makeJSON(0, "잘못된 요청입니다");
		GroupDao groupDao = sqlSession.getMapper(GroupDao.class);
		System.out.println(parameter);
		if(type != null) {
			if(type.equals("apply")) {
				GroupMemberDto groupMemberDto = new GroupMemberDto();
				groupMemberDto.setGroupNum(Integer.parseInt(parameter.get("groupNum")));
				groupMemberDto.setGroupMemberStatecode("W");
				groupMemberDto.setUserId(parameter.get("userId"));
				groupDao.insertGroupMember(groupMemberDto);
				
				json = makeJSON(1, "모임에 가입신청 되었습니다. 모임장이 승인해야 가입이 완료됩니다.");
			}else if(type.equals("leader")) {
				//TO-DO
			}else if(type.equals("fire")) {
				//TO-DO
			}else if(type.equals("applyok")) {
				//TO-DO
			}else if(type.equals("applyno")) {
				//TO-DO
			}
		}
		//1 : apply - 가입요청  
		//2 : leader - 리더변경  
		//3 : fire - 퇴출   
		//4 : applyok - 승인   
		//5 : applyno - 승인거부
		
		return json;
	}
	
	@Override
	public List<GroupMemberDto> getGroupMemberList(int groupNum) {
		return sqlSession.getMapper(GroupDao.class).getGroupMemberList(groupNum);
	}
	
	public String makeJSON(int resultCode, Object resultData) {
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("resultCode", resultCode);
		if(resultData instanceof Collection) {
			jsonObject.put("resultData", new JSONArray(resultData));
		}else if(resultData instanceof String) {
			jsonObject.put("resultData", resultData.toString());
		}else {
			jsonObject.put("resultData", new JSONObject(resultData));
		}
		
		return jsonObject.toString();
		
	}
}
