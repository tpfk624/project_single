package com.kitri.single.group.contorller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kitri.single.group.service.ChatService;
import com.kitri.single.user.model.UserDto;

public class ChatController extends TextWebSocketHandler{
	
	@Autowired
	private ChatService chatService;
	
	//로그
	private static final Logger logger = LoggerFactory.getLogger(GroupController.class);
	
	Map<String, List<WebSocketSession>> chatMap = new ConcurrentHashMap<String, List<WebSocketSession>>();
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		String groupNum = (String)session.getAttributes().get("groupNum");
		//session.getId();
		List<WebSocketSession> list = chatMap.get(groupNum);
		list.remove(session);
		if(list.size() == 0) {
			chatMap.remove(groupNum);
		}
		
		super.afterConnectionClosed(session, status);
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		logger.info("session : " + session);
		logger.info((String)session.getAttributes().get("groupNum"));
		logger.info( ((UserDto)session.getAttributes().get("userInfo")).toString());
		
		String groupNum = (String)session.getAttributes().get("groupNum");
		
		List<WebSocketSession> list =  chatMap.get(groupNum);
		if(list == null) {
			list = new ArrayList<WebSocketSession>();
			chatMap.put(groupNum, list);
		}
		list.add(session);
		
		//super.afterConnectionEstablished(session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info("message : " + message.toString());
		logger.info("payload : " + message.getPayload());
		
		JSONObject jsonObject = new JSONObject(message.getPayload());
		String groupNum = jsonObject.getString("groupNum");
		String msgType = jsonObject.getString("type");
		String chatContent = jsonObject.getString("chatContent");
		logger.info(jsonObject.toString());
		
		//
	}

}
