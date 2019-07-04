package com.kitri.single.member.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kitri.single.user.model.UserDto;
import com.kitri.single.user.service.UserService;
import com.kitri.single.user.service.UserServiceImpl;

@Controller
@RequestMapping("/member")
@SessionAttributes("userInfo")
public class MemberController {
	private Logger logger =LoggerFactory.getLogger(MemberController.class);
    
	@Autowired
	UserService userService;

	
    //회원가입페이지이동
	@RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register() {		
    	return "member/register";
	}
	
	//회원가입
	@RequestMapping(value = "/register", method = RequestMethod.POST) 
	public String register(UserDto userDto,Model model) {
		logger.info(userDto.toString());
		userService.regist(userDto);
		model.addAttribute("userInfo", userDto);
		return "member/register";
	}
	//로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.POST) 
	public String logout(UserDto userDto,Model model) {
		logger.info(userDto.toString());
		userService.regist(userDto);
		model.addAttribute("userInfo", userDto);
		return "member/register";
	}

 
}
