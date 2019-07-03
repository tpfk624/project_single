package com.kitri.single.group.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
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
import com.kitri.single.group.model.GroupDto;
import com.kitri.single.hashtag.dao.HashtagDao;
import com.kitri.single.user.model.UserDto;
import com.kitri.single.util.SiteConstance;

@Service
public class GroupServiceImpl implements GroupService{
	
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
		
		return sqlSession.getMapper(GroupDao.class).getGroupList(parameter);
	}

	@Override
	@Transactional
	public String getGroupDetail(int groupNum) {
		//그룹 정보 가져오기
		GroupDto groupDto = sqlSession.getMapper(GroupDao.class).getGroup(groupNum);
		
		//해시태그 정보
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

}
