package com.kitri.single.user.service;

import java.util.Collection;
import java.util.HashMap;

import java.util.List;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONArray;
import org.json.JSONObject;

import org.slf4j.Logger;

import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import org.springframework.transaction.annotation.Transactional;

import com.kitri.single.board.model.BoardDto;
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
		
		System.out.println("정보수정 서비스임플 옴");
		
		if(!userDto.getNewpass().isEmpty()) {
			System.out.println("비번 변경 + 정보 수정!");
			sqlSession.getMapper(UserDao.class).userModifynew(userDto); //비밀번호 변경 + 정보 수정
		}else {
			System.out.println("비번 변경안함 + 정보 수정!");			
			sqlSession.getMapper(UserDao.class).userModify(userDto);	//비밀번호 유지 + 정보 수정
		}
		
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
	public List<GroupDto> getMyGroup(Map<String, String> parameter) {
		List<GroupDto> list = sqlSession.getMapper(UserDao.class).getMyGroup(parameter);
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
	@Transactional
	public String stampDelete(String userId, int groupNum) {
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("userId", userId);
		parameter.put("groupNum", groupNum);
		 UserDao userDao = sqlSession.getMapper(UserDao.class);
		userDao.stampDelete(parameter);
		return makeJSON(1, "찜 모임을 취소했습니다. 나의 찜목록 페이지에서 확인하세요");
	}
	
	
	//////////////////////////////////게시물 관리 페이지////////////////////////////////////////////////
	
	@Override
	public List<BoardDto> getBoardAll(Map<String, String> parameter) {
		return sqlSession.getMapper(UserDao.class).getBoardAll(parameter);
	}

	@Override
	public List<BoardDto> getBoardOther(Map<String, String> parameter, String option) {
		
		if(option.equals("selected")) {
			System.out.println("내가 쓴 글 서비스임플옴");
			List<BoardDto> list = sqlSession.getMapper(UserDao.class).getBoardAll(parameter);
			return list;
		}else if(option.equals("reply")){
			System.out.println("나의 댓글 서비스임플옴");			
			List<BoardDto> list = sqlSession.getMapper(UserDao.class).getBoardOther(parameter);
			return list;
		}else {
			System.out.println("찜한 글 서비스임플옴");			
			List<BoardDto> list = sqlSession.getMapper(UserDao.class).getBoardHeart(parameter);
			return list;
		}
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