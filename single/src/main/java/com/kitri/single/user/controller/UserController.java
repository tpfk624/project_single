package com.kitri.single.user.controller;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kitri.single.user.model.UserDto;
import com.kitri.single.user.service.UserService;
import com.kitri.single.user.service.UserServiceImpl;

@Controller
@RequestMapping("/user")
public class UserController {
	private Logger logger =LoggerFactory.getLogger(UserController.class);
    
	@Autowired
	UserService userService;
	

	@RequestMapping("/home")
	public void home() {
		System.out.println("home 들어옴");
	}
	
    //회원가입페이지이동
	@RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register() {		
    	return "user/register";
	}
	
	//회원가입
	@RequestMapping(value = "/register", method = RequestMethod.POST) 
	public String register(UserDto userDto) {
		logger.info(userDto.toString());
		userService.regist(userDto);
		return "user/register";
	}


 
}
