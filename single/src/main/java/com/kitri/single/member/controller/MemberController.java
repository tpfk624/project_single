package com.kitri.single.member.controller;

import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kitri.single.member.service.MemberService;
import com.kitri.single.user.model.UserDto;
import com.kitri.single.user.service.UserService;
import com.kitri.single.user.service.UserServiceImpl;

@Controller
@RequestMapping("/member")
@SessionAttributes("userInfo")
public class MemberController {
	private Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	MemberService memberService;

	// 회원가입페이지이동
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register() {
		return "member/register";
	}

	// 회원가입
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(UserDto userDto, Model model) {
		logger.info(userDto.toString());
		memberService.regist(userDto);
		model.addAttribute("userInfo", userDto);
		return "member/register";
	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(SessionStatus status, HttpServletRequest request, HttpSession session) {
		String oldUrl = request.getHeader("referred");
		logger.info(oldUrl);
//		status.setComplete();
		session.removeAttribute("userInfo");
		return "member/naverlogintest";
	}

	// 인증 메일 전달
	@RequestMapping(value = "/joinpost", method = RequestMethod.POST)
	public String joinPost(@RequestParam(name = "email") String email) throws Exception {
		memberService.sendAuthMail(email);
		return "member/emailsendok";
	}

	// 메일로부터 답장받기 email / authkey
	@RequestMapping(value = "/joinconfirm", method = RequestMethod.GET)
	public String emailConfirm(@RequestParam HashMap<String, String> paramMap,Model model) throws Exception {
		String email = paramMap.get("email");
		String authKey = paramMap.get("authKey");
		UserDto userDto = new UserDto();
		logger.info("email:" + email);
		logger.info("authkey:" + authKey);

		userDto.setUserId(email);
		userDto.setAuthKey(authKey);
		userDto.setAuthState("1");

		// 이메일 유효상태
		memberService.updateAuthstatus(userDto);

		model.addAttribute("userInfo", userDto);
		return "member/emailauthok";
	}

}
