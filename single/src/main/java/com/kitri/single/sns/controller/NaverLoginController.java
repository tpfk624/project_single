package com.kitri.single.sns.controller;

import java.io.IOException;
import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
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

import com.kitri.single.sns.model.SnsDto;
import com.kitri.single.sns.service.NaverLoginService;
import com.kitri.single.sns.service.NaverLoginServiceImpl;
import com.kitri.single.user.model.UserDto;
import com.kitri.single.util.Utill;

@Controller
@RequestMapping(value = "/naverlogin")
public class NaverLoginController {
	Logger logger = LoggerFactory.getLogger(NaverLoginController.class);
	
	@Autowired
	NaverLoginService loginService; 	

	APIMemberProfile apiMemberProfile = new APIMemberProfile();

	@RequestMapping(value = "/callback", method = RequestMethod.POST)
	public String callback(@RequestParam Map<String, String> parameter, Model model) {
		
		String email = parameter.get("email");
		String accessToken = parameter.get("accessToken");
		
		logger.debug(email);
		System.out.println("email:" +email);
		logger.debug(accessToken);
		System.out.println("accessToken:" +accessToken);
		String userProfile = apiMemberProfile.getMemberProfile(accessToken);
		
		logger.debug(userProfile);
		System.out.println("userProfile:" +userProfile);
		
		JSONObject resultJson = new JSONObject(userProfile);
		JSONObject profileObj = (JSONObject) resultJson.get("response");
		
		String id = Utill.getStringJson(profileObj, "id");
		String nickname = Utill.getStringJson(profileObj, "nickname");		
		String age = Utill.getStringJson(profileObj, "age");
		String gender = Utill.getStringJson(profileObj, "gender");
		String userName = Utill.getStringJson(profileObj, "name");
		String birthday = Utill.getStringJson(profileObj, "birthday");
		String profile_image = Utill.getStringJson(profileObj, "profile_image");

		
		logger.info("id: " + id);
		logger.info("userName: " + userName);
		logger.info("nickname: " + nickname);
		logger.info("age: " + age);
		logger.info("gender: " + gender);
		logger.info("birthday: " + birthday);
		logger.info("profile_image: " + profile_image);
		
		SnsDto snsDto = new SnsDto();
		
		
		snsDto.setUserId(id);
		snsDto.setSnsName(userName);
		snsDto.setSnsNickname(nickname);
		snsDto.setSnsGender(gender);
		snsDto.setSnsBirthday(birthday);
		snsDto.setSnsProfile(profile_image);
		
		
		
		//DB에 입력
//		int result = loginService.registerUser(naverUserDto);
//		logger.info("regitser result cnt : " + result);
		model.addAttribute("snsInfo", snsDto);

		//views/user/result.jsp
		return "user/result";
//		return new ModelAndView("redirect:/index.jsp","naverUserInfo",userProfile);
	}

	@RequestMapping(value = "/mvcallback", method = RequestMethod.GET)
	public String mvcallback(@RequestParam Map<String, String> parameter, Model model, HttpServletRequest request) {
		logger.info("--mvcallback");

		String referer = request.getHeader("referer");
		logger.info("referer:" + referer);
		String access_token = parameter.get("access_token");
		String state = parameter.get("state");
		String token_type = parameter.get("token_type");
		String expires_in = parameter.get("expires_in");

		logger.info("access_token:" + access_token);
		logger.info("state:" + state);
		logger.info("token_type:" + token_type);
		logger.info("expires_in:" + expires_in);

		return "index";
	}

}
