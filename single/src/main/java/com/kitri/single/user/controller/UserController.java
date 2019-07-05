package com.kitri.single.user.controller;

import java.io.IOException;

import java.util.HashMap;

import java.util.List;

import java.util.Map;

import javax.servlet.ServletContext;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;

import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.bind.annotation.SessionAttribute;

import org.springframework.web.bind.annotation.SessionAttributes;

import org.springframework.web.multipart.MultipartFile;

import com.kitri.single.group.dao.GroupDao;
import com.kitri.single.group.model.GroupDto;
import com.kitri.single.group.service.GroupService;
import com.kitri.single.user.model.UserDto;

import com.kitri.single.user.service.UserService;

import com.kitri.single.util.Utill;

@Controller

@RequestMapping("/mypage")

@SessionAttributes("userInfo")

public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private ServletContext servletContext;


	// 로그
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	// 첫페이지용
	@RequestMapping(value = "/groupall", method = RequestMethod.GET)

	public String groupall(Model model, HttpSession session) {

		UserDto userInfo = (UserDto) session.getAttribute("userInfo");

		Map<String, String> parameter = new HashMap<String, String>();

		parameter.put("page", "1");

		if (userInfo != null) {

			parameter.put("userId", userInfo.getUserId());

		}

		parameter.put("groupNum", null);

		parameter.put("key", null);

		parameter.put("word", null);

		List<GroupDto> list = userService.getGroupAll(parameter);

		int size = list.size();

		System.out.println(parameter);

		model.addAttribute("parameter", parameter);

		model.addAttribute("size", size);

		model.addAttribute("groupList", list);

		return "mypage/group";

	}
	
	@RequestMapping("/select")
	public String groupSelect(@SessionAttribute("userInfo") UserDto user, 
			@RequestParam(name = "option") String option,
			Model model) {
		System.out.println("option : " + option);
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", user.getUserId());
		map.put("option", option);		
		List<GroupDto> list = userService.getMyGroup(map);
		model.addAttribute("groupList", list);
		return "/mypage/groupresult" ;
	}

	@RequestMapping(value = "/groupleader", method = RequestMethod.GET)
	@ResponseBody
	public String groupreader(Model model, HttpSession session) {
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		Map<String, String> parameter = new HashMap<String, String>();
		parameter.put("page", "1");
		if (userInfo != null) {
			parameter.put("userId", userInfo.getUserId());
		}
		
		parameter.put("groupNum", null);
		parameter.put("key", null);
		parameter.put("word", null);
		
		List<GroupDto> list = userService.getGroupLeader(parameter);
		int size = list.size();

		System.out.println(parameter);

		model.addAttribute("parameter", parameter);

		model.addAttribute("size", size);

		model.addAttribute("groupList", list);
		
		return "000";
	}
	
	
	

	@RequestMapping(value = "/groupmember", method = RequestMethod.GET)
	@ResponseBody
	public String groupmember(Model model, HttpSession session) {

		UserDto userInfo = (UserDto) session.getAttribute("userInfo");

		Map<String, String> parameter = new HashMap<String, String>();

		parameter.put("page", "1");

		if (userInfo != null) {

			parameter.put("userId", userInfo.getUserId());

		}

		parameter.put("groupNum", null);

		parameter.put("key", null);

		parameter.put("word", null);

		List<GroupDto> list = userService.getGroupMember(parameter);

		int size = list.size();

		System.out.println(parameter);

		model.addAttribute("parameter", parameter);

		model.addAttribute("size", size);

		model.addAttribute("groupList", list);

		return "000";

	}

	/////////////// 마이페이지 수정부분////////////////////////

	@RequestMapping("/mypage")

	public void home(Model model, HttpSession session) {

		System.out.println("home 들어옴");

		// 여기에다가 서비스통해서 userdto를 db에담고 그걸 모델에 담아서 select 홈안에 모델메개변수 잡아주기

		// 모델안에 애드어트리뷰트 하고 화면단에뿌려주기

		String path = "";

		UserDto userDto = (UserDto) session.getAttribute("userinfo");

		/* model.addAttribute("userDto", userService.viewUser(session)); */

		model.addAttribute("article", userDto);

	}

	// 수정

	@RequestMapping(value = "/modify", method = RequestMethod.POST)

	public String modify(UserDto userDto, @SessionAttribute("userInfo") UserDto userInfo,

			@RequestParam("imgdata") MultipartFile multipartFile) { // 사진정보 파일을 받음

		System.out.println(userDto);

		System.out.println(multipartFile);

		System.out.println("여기까지 들어오니");

		if (multipartFile != null && !multipartFile.isEmpty()) {

			String realPath = servletContext.getRealPath("");

			System.out.println(realPath);

			String src = "";

			try {

				src = Utill.profileUpload(multipartFile, "user", realPath, servletContext.getContextPath());

			} catch (IllegalStateException e) {

				// TODO Auto-generated catch block

				e.printStackTrace();

			} catch (IOException e) {

				// TODO Auto-generated catch block

				e.printStackTrace();

			}

			userDto.setUserProfile(src);// 경로값

			System.out.println(userDto);

		}

		return null;

	}

}