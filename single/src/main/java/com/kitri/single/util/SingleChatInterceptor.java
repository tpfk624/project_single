package com.kitri.single.util;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import com.kitri.single.group.contorller.GroupController;
import com.kitri.single.user.model.UserDto;

import sun.util.logging.resources.logging;

public class SingleChatInterceptor extends HttpSessionHandshakeInterceptor{
	
	//로그
	private static final Logger logger = LoggerFactory.getLogger(GroupController.class);
	
	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Map<String, Object> attributes) throws Exception {
		ServletServerHttpRequest serverHttpRequest = (ServletServerHttpRequest) request;
		HttpServletRequest httpServletRequest = serverHttpRequest.getServletRequest();
		String groupNum = httpServletRequest.getParameter("groupNum");
		//logger.info("groupNum1 : " + groupNum);
		
		UserDto userInfo = (UserDto)httpServletRequest.getSession().getAttribute("userInfo");
		//logger.info("userInfo : " + userInfo);
		
		attributes.put("groupNum", groupNum);
		attributes.put("userInfo", userInfo);
		
		
		//attributes.put("groupNum", groupNum);
		
		return super.beforeHandshake(request, response, wsHandler, attributes);
	}
	
	@Override
	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Exception ex) {
		// TODO Auto-generated method stub
		super.afterHandshake(request, response, wsHandler, ex);
	}
	
}
