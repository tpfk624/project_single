package com.kitri.single.group.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
import com.kitri.single.group.dao.RecomendDao;
import com.kitri.single.group.model.CalendarDto;
import com.kitri.single.group.model.GroupDto;
import com.kitri.single.group.model.GroupMemberDto;
import com.kitri.single.hashtag.dao.HashtagDao;
import com.kitri.single.hashtag.model.HashtagDto;
import com.kitri.single.user.model.UserDto;
import com.kitri.single.util.NumberCheck;
import com.kitri.single.util.SiteConstance;

@Service
public class GroupServiceImpl2 implements GroupService2 {
	//로그
	private static final Logger logger = LoggerFactory.getLogger(GroupServiceImpl2.class);
		
	@Autowired
	private SqlSession sqlSession;
	

	@Override
	public List<GroupDto> getRecommendGroupList(Map<String, Object> parameter) {
		UserDto userDto = (UserDto)(parameter.get("userDto"));
		
		
		int page = NumberCheck.NotNumberToOne((String)parameter.get("page"));
		int groupSize = SiteConstance.GROUP_SIZE;
				
		int endRow = page * groupSize;
		int startRow = endRow - groupSize;
		
		parameter.put("endRow", endRow + "");
		parameter.put("startRow", startRow + "");
		
		//logger.debug(">>>>>"+userDto.toString());
		List<String> list = (List<String>)sqlSession.getMapper(RecomendDao.class).getRecommendTagList(userDto);
		
		List<String> parseStrtag = new ArrayList<String>();
		StringBuffer sb = new StringBuffer();
		for(int i=0; i<list.size(); i++) {
			String str = list.get(i);
			if(str==null) {
				continue;
			}
			int len= str.length();
//			logger.debug(">>>>>"+str+" len:"+len);
			if(len <= 2) {
//				logger.debug(">>>>>add1");		
//				parseStrtag.add(str);
				sb.append("|"+str);
			}else {
//				logger.debug(">>>>>add2");
				for(int j =len; j>=2;j--) {
//					parseStrtag.add(str.substring(0, j));
					sb.append("|"+str.substring(0, j));
				}	
			}
		}
		if(sb.length() != 0) {
			sb.deleteCharAt(0);
		}
		String parseTagStr= sb.toString();
		logger.debug(">>>>>태그 파싱 후 "+parseTagStr);
	
//		logger.debug(">>>>>파싱 후 ");
//		for(String str : parseStrtag) {
//			logger.debug(">>>>>"+str);
//		}
		List<String>resultList = (List<String>)sqlSession.getMapper(RecomendDao.class).getResultList(parseTagStr);
		logger.debug(">>>>>결과값 개수:"+ (resultList.equals(null)?"null":resultList.size()) );	
		for(String groupNum : resultList) {
			if(groupNum!= null) {
				logger.debug(">>>>>결과 그룹 번호: "+groupNum);	
			}
		}
		
//		Map<String, List<String>> paramMap = new HashMap<String, List<String>>();
//		paramMap.put("list", resultList);
		List<GroupDto> groupRecommendList = new ArrayList<GroupDto>();
		if(resultList.size()!=0) {
			groupRecommendList = (List<GroupDto>)sqlSession.getMapper(RecomendDao.class).getGroupDtoList(resultList);	
		}else if( groupRecommendList.size()==0 ) {
			groupRecommendList = (List<GroupDto>)sqlSession.getMapper(RecomendDao.class).getSingleRecommendList();
//			groupRecommendList =(List<GroupDto>)sqlSession.getMapper(RecomendDao.class).getGroupDtoList(resultList);
		}
		
		if(groupRecommendList.size()>=20) {
			groupRecommendList= groupRecommendList.subList(0, 19);
		}
		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = new JSONArray(list);
		jsonObject.put("groupList", jsonArray);
		return groupRecommendList;
	}


}
