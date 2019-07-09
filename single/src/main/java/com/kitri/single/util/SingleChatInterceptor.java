package com.kitri.single.util;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import com.kitri.single.group.contorller.GroupController;

import sun.util.logging.resources.logging;

public class SingleChatInterceptor extends HttpSessionHandshakeInterceptor{
	
	//로그
	private static final Logger logger = LoggerFactory.getLogger(GroupController.class);
	
	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Map<String, Object> attributes) throws Exception {
		ServletServerHttpRequest serverHttpRequest = (ServletServerHttpRequest) request;
		String groupNum = (String)serverHttpRequest.getServletRequest().getSession().getAttribute("groupNum");
		logger.info("groupNum : " + groupNum);
		attributes.put("groupNum", groupNum);
		
		return super.beforeHandshake(request, response, wsHandler, attributes);
	}
	
}
