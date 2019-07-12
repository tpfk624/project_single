package com.kitri.single.group.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kitri.single.group.dao.ChatDao;
import com.kitri.single.group.model.ChatDto;

@Service
public class ChatServiceImpl implements ChatService{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	@Transactional
	public String insertChat(ChatDto chatDto, String userNickname) {
		ChatDao chatDao = sqlSession.getMapper(ChatDao.class);
		//저장전 시간 불러오기
		String chatTime = chatDao.getTimstamp();
		chatDto.setChatTime(chatTime);
		
		//저장하기
		chatDao.insertChat(chatDto);		
		
		//다시 불러오기
		chatDto = chatDao.selectChat(chatDto);
		chatDto.setUserNickname(userNickname);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("resultCode", 1);
		jsonObject.put("resultData", new JSONObject(chatDto));
		
		return jsonObject.toString();
	}

	@Override
	public String selectChatList(int groupNum) {
		List<ChatDto> list = sqlSession.getMapper(ChatDao.class).selectChatList(groupNum);
		JSONObject jsonObject = new JSONObject();
		
		jsonObject.put("resultCode", 2);
		jsonObject.put("resultData", new JSONArray(list));
		
		return jsonObject.toString();
	}
	
	@Override
	public String selectChat(Map<String, String> parameter) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String selectChatList(Map<String, String> parameter) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
}
