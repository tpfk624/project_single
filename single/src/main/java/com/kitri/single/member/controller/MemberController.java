package com.kitri.single.member.controller;

import java.util.HashMap;

import javax.inject.Inject;
import javax.mail.Session;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kitri.single.member.service.MemberService;
import com.kitri.single.user.model.UserDto;
import com.kitri.single.user.service.UserService;
import com.kitri.single.user.service.UserServiceImpl;

//Controller는 요청과 응답을 처리한다.
@Controller
@RequestMapping("/member")
@SessionAttributes("userInfo")
public class MemberController {
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	public static final String HOME_REDIRECT_URL ="redirect:/index_logintest.jsp";
	@Autowired
	MemberService memberService;	
	
	// 회원가입페이지이동
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register() {
		return "member/register/register";
	}

	// 회원가입 (유저정보 입력)
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(UserDto userDto, Model model) {
		logger.info(userDto.toString());
		memberService.regist(userDto);
		model.addAttribute("userInfo", userDto);
		return HOME_REDIRECT_URL;
	}
	
	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(UserDto userDto, Model model) {
		userDto = memberService.login(userDto);
		//로그인 성공
		if(userDto != null) {
			model.addAttribute("userInfo", userDto);
		}else {
			model.addAttribute("userInfo", null);
		}
		return HOME_REDIRECT_URL ;
	}
	
	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(SessionStatus status, HttpServletRequest request, HttpSession session) {
		String oldUrl = request.getHeader("REFERER");
		logger.info(oldUrl);
//		status.setComplete();
		if(session.getAttribute("userInfo") != null) {
			session.removeAttribute("userInfo");	
		}
		return "redirect:/"+oldUrl;
	}

	// 이메일 인증페이지 이동
	@RequestMapping(value = "/emailauth", method = RequestMethod.GET)
	public String emailauth() throws Exception {
		return "member/emailauth/emailauth";
	}
	
	// 메일인증 
	@ResponseBody
	@RequestMapping(value = "/sendemail", method = RequestMethod.POST)
	public String sendemail(@RequestBody UserDto userDto,Model model) throws Exception {
		logger.info(">>>>"+ userDto.getUserId());
		//TODO 아이디가 존재할경우 로그인 ㄱㄱ.
		//아이디 인증키 인증상태
//		userDto = memberService.getUser(userDto);
		
		userDto = memberService.sendAuthMail(userDto);		
		// 아이디 부재, 인증상태 ==0 -> 인증메일 발송 
		// 아이디 존재 , 인증상태 ==0 -> 인증메일 재발송
//		if(userDto == null && "0".equals(userDto.getAuthState()) ) {
//			userDto = memberService.sendAuthMail(userDto);	
//			model.addAttribute("userInfo", userDto);
//		}else {
//			model.addAttribute("userInfo", null);
//		}
		
		
		
		logger.info(">>>>"+ userDto.toString());
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(userDto);
		return json;
	}

	// 인증키 확인
	@RequestMapping(value = "/authconfirm", method = RequestMethod.GET)
	public String authconfirm(String email, String authKey,Model model) throws Exception {
//		String email = userDto.getUserId();
//		String authKey = userDto.getAuthKey();
		logger.info("email:" + email);
		logger.info("authkey:" + authKey);
		UserDto userDto =new UserDto();
		userDto.setUserId(email);
		userDto.setAuthKey(authKey);
		userDto.setAuthState("1");

		// 이메일 유효상태
		memberService.updateAuthstatus(userDto);

		model.addAttribute("userInfo", userDto);
		return "member/register/register";
	}

//	@ResponseBody
//	@RequestMapping(value = "/authconfirm", method = RequestMethod.GET)
//	public String emailConfirm(@RequestBody UserDto userDto,Model model) throws Exception {
//		String email = userDto.getUserId();
//		String authKey = userDto.getAuthKey();
//		logger.info("email:" + email);
//		logger.info("authkey:" + authKey);
//
//		userDto.setUserId(email);
//		userDto.setAuthKey(authKey);
//		userDto.setAuthState("1");
//
//		// 이메일 유효상태
//		memberService.updateAuthstatus(userDto);
//
//		model.addAttribute("userInfo", userDto);
//		return "member/emailauthok";
//	}
	

}
