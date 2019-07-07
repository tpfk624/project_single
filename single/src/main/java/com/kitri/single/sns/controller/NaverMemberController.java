package com.kitri.single.sns.controller;


import java.util.Calendar;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.kitri.single.sns.model.SnsDto;
import com.kitri.single.sns.service.NaverLoginService;
import com.kitri.single.sns.service.NaverLoginServiceImpl;
import com.kitri.single.user.model.UserDto;
import com.kitri.single.util.Utill;

@Controller
@RequestMapping(value = "/navermember")
@SessionAttributes("userInfo")
public class NaverMemberController {
	Logger logger = LoggerFactory.getLogger(NaverMemberController.class);
	
	@Autowired
	NaverLoginService loginService; 	

	APIMemberProfile apiMemberProfile = new APIMemberProfile();
	

	@RequestMapping(value = "/callback", method = RequestMethod.POST)
	public String callback(@RequestParam Map<String, String> parameter, Model model) {
		
		String email = parameter.get("email");//인증시 필수입력값
		String accessToken = parameter.get("accessToken");
		logger.debug(email);
		logger.debug(accessToken);

		UserDto userDto = loginService.getUser(email);
//		이소셜로는 처음 로그인 합니다.
		if(userDto == null) {
			String userProfile = apiMemberProfile.getMemberProfile(accessToken);
			JSONObject resultJson = new JSONObject(userProfile);
			JSONObject profileObj = (JSONObject) resultJson.get("response");
			
			String snsId = Utill.getStringJson(profileObj, "id");
			
			String userNickname = Utill.getStringJson(profileObj, "nickname");
			if( userNickname == null) {
				userNickname= UUID.randomUUID().toString();
			}
			String userAge= Utill.getStringJson(profileObj, "age");
			String userGender = Utill.getStringJson(profileObj, "gender");
			String userName = Utill.getStringJson(profileObj, "name");
			String userBirthday = Utill.getStringJson(profileObj, "birthday");
			String userProfile_image = Utill.getStringJson(profileObj, "profile_image");
			logger.info("id: " + snsId);
			logger.info("userName: " + userName);
			logger.info("nickname: " + userNickname);
			logger.info("age: " + userAge);
			logger.info("gender: " + userGender);
			logger.info("birthday: " + userBirthday);
			logger.info("profile_image: " + userProfile_image);
			SnsDto snsDto = new SnsDto();
			//TODO 갱신토큰 DB 저장 필요
			snsDto.setSnsType("naver");
			snsDto.setSnsId(snsId);
			snsDto.setSnsConnectDate(Calendar.getInstance().getTime().toString());
			//TODO 닉네임이 없다면 랜덤uuid값으로 지정
			userDto = new UserDto();
			userDto.setUserId(email);
			userDto.setUserName(userName);
			userDto.setUserNickname(userNickname);
			userDto.setUserGender(userGender);
			userDto.setUserBirthday(userBirthday);
			userDto.setUserProfile(userProfile_image);
			userDto.setSnsDto(snsDto);

			model.addAttribute("userInfo", userDto);
			
			// 회원가입, 소셜 연동 창으로 이동 
			return "member/register/register";
		}else {
			
		}
		return "index";

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
