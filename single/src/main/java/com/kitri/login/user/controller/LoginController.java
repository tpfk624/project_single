package com.kitri.login.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value= "/user")
public class LoginController {
	Logger logger =  LoggerFactory.getLogger(LoginController.class);
	
	 @RequestMapping("/login")
	    public ModelAndView login() {
	        String message = "Simple Login Page";
	        return new ModelAndView("login", "message", message);
	    }
	 
	    @RequestMapping("/logincallback")
	    public ModelAndView callback() {
	        String message = "Simple Callback Page";
	        logger.debug(message);
	        return new ModelAndView("callback", "message", message);
	    }
}
