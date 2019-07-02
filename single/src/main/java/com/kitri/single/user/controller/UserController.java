package com.kitri.single.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

	@RequestMapping("/home")
	public void home() {
		System.out.println("home 들어옴");
	}
	
	@RequestMapping("/regiser")
	public String register() {
		
		return "";
	}
}
