package com.kitri.single.group.service;

import java.util.Map;

import com.kitri.single.group.model.ChatDto;

public interface ChatService {
	
	public String insertChat(ChatDto chatDto, String userNickname);
	public String selectChat(Map<String, String> parameter);
	public String selectChatList(Map<String, String> parameter);
	public String selectChatList(int groupNum);
}
