package com.naver.naverlogin.controller;

import java.io.IOException;
import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.naver.naverlogin.model.NaverUserDto;

@Controller
@RequestMapping(value = "/user")
public class NaverLoginController {
	
	
	APIMemberProfile apiMemberProfile = new APIMemberProfile();
	
	@RequestMapping(value ="/callback", method = RequestMethod.POST) 
	public String callback(@RequestParam Map<String,String> parameter ,Model model){
		String email =parameter.get("email");
		String accessToken =parameter.get("accessToken");
		
		String userProfile=apiMemberProfile.getMemberProfile(accessToken);
		System.out.println(userProfile);
		JSONObject resultJson = new JSONObject(userProfile);
		JSONObject profileObj=(JSONObject) resultJson.get("response");
		
		String id = (String) profileObj.get("id");
		String name = (String) profileObj.get("name"); //유니코드
		System.out.println("id: "+id);
		System.out.println("name: "+name);
		NaverUserDto naverUserDto = new NaverUserDto();
		naverUserDto.setId(id);
		naverUserDto.setName(name);
//		naverUserDto.setNickname(nickname);
		model.addAttribute("userProfile", naverUserDto);
		return "user/result";
		//foward방식
//		return new ModelAndView("redirect:/index.jsp","naverUserInfo",userProfile);
	}
}


