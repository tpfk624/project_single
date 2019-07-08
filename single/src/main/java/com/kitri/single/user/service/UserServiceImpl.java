package com.kitri.single.user.service;

import java.util.HashMap;

import java.util.List;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import org.json.JSONObject;

import org.slf4j.Logger;

import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import org.springframework.transaction.annotation.Transactional;

import com.kitri.single.group.dao.GroupDao;

import com.kitri.single.group.model.GroupDto;

import com.kitri.single.group.service.GroupServiceImpl;

import com.kitri.single.hashtag.dao.HashtagDao;

import com.kitri.single.user.dao.UserDao;

import com.kitri.single.user.model.UserDto;

import com.kitri.single.util.SiteConstance;

@Service

public class UserServiceImpl implements UserService {

	@Autowired

	private SqlSession sqlSession;

	// 로그

	private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

	@Override
	public List<GroupDto> getGroupAll(Map<String, String> parameter) {
		return sqlSession.getMapper(UserDao.class).getGroupAll(parameter);
	}

	@Override
	@Transactional
	public String getGroupDetail(int groupNum) {
		// 그룹 정보 가져오기
		GroupDto groupDto = sqlSession.getMapper(GroupDao.class).getGroup(groupNum);
		// 해시태그 정보
		Map<String, Integer> parameter = new HashMap<String, Integer>();
		parameter.put("tagType", 2);
		parameter.put("groupNum", groupNum);
		List<String> tagList = sqlSession.getMapper(HashtagDao.class).getHashtagList(parameter);
		JSONObject jsonObject = new JSONObject();
		JSONObject groupJson = new JSONObject(groupDto);
		jsonObject.put("group", groupJson);
		jsonObject.put("taglist", tagList);
		return jsonObject.toString();
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
	public List<GroupDto> getMyGroup(Map<String, String> parameter) {
		List<GroupDto> list = sqlSession.getMapper(UserDao.class).getMyGroup(parameter);
		return list;
	}

	@Override
	public void leaveGroup(Map<String, String> parameter) {
		
		
	}

	@Override
	public List<GroupDto> getStampGroup(Map<String, String> parameter) {
		return sqlSession.getMapper(UserDao.class).getStampGroup(parameter);
	}

	@Override
	public List<GroupDto> getMyStamp(Map<String, String> parameter) {
		List<GroupDto> list = sqlSession.getMapper(UserDao.class).getMyStamp(parameter);
		return list;
	}

	
	
	@Override
	public void stampDelete(Map<String, String> parameter) {
			
	}

	@Override
	public UserDto userInfom(String userId) {
		
		return null;
	}

	@Override
	public void userModify(UserDto userDto) {
		
		
	}

	@Override
	public void userDelete(String userId) {
		
		
	}



}