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

	
	//////////////////////////////////내정보 수정 페이지////////////////////////////////////////////////
		
	//회원정보 상세조회
	@Override
	public UserDto userInfom(String id) {
		return sqlSession.getMapper(UserDao.class).userInfom(id);
	}
	
	//회원 정보 수정
	@Override
	public void userModify(UserDto userDto) {
		// TODO Auto-generated method stub
		
	}
	
	//회원 탈퇴
	@Override
	public void userDelete(String id) {
		System.out.println("회원탈퇴  서비스 임플 옴");
		sqlSession.getMapper(UserDao.class).userDelete(id);
	}
	
	//////////////////////////////////나의 모임관리 페이지////////////////////////////////////////////////
	
	@Override
	public List<GroupDto> getGroupAll(Map<String, String> parameter) {
		return sqlSession.getMapper(UserDao.class).getGroupAll(parameter);
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


	
	
	//////////////////////////////////찜한 모임관리 페이지////////////////////////////////////////////////
	
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
	public String groupStamp(String userId, int groupNum) {
	// TODO Auto-generated method stub
	return null;
	}



//	@Override
//	@Transactional
//	public String groupStamp(String userId, int groupNum) {
//		Map<String, Object> parameter = new HashMap<String, Object>();
//		parameter.put("userId", userId);
//		parameter.put("groupNum", groupNum);
//		GroupDao groupDao = sqlSession.getMapper(GroupDao.class);
//		if(groupDao.countGroupStamp(parameter) == 0) {
//			groupDao.insertGroupStamp(parameter);
//		}else {
//			return makeJSON(2, "이미 찜한 모임입니다");
//		}
//		
//		return makeJSON(1, "모임을 찜했습니다. 나의 찜목록 페이지에서 확인하세요");
//	}
	
	



}