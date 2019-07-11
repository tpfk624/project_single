package com.kitri.single.group.dao;

import java.util.List;

import com.kitri.single.group.model.ChatDto;

public interface ChatDao {

	public void insertChat(ChatDto chatDto);
	public ChatDto selectChat(ChatDto chatDto);
	public String getTimstamp();
	public List<ChatDto> selectChatList(int groupNum);

}
