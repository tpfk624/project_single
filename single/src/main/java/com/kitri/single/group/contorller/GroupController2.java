package com.kitri.single.group.contorller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kitri.single.group.model.GroupDto;
import com.kitri.single.group.service.GroupService;
import com.kitri.single.group.service.GroupService2;
import com.kitri.single.member.service.MemberService;
import com.kitri.single.user.model.UserDto;
import com.kitri.single.util.NumberCheck;

@Controller
@RequestMapping("/group2")
@SessionAttributes(names = {"userInfo"})
public class GroupController2 {
	
	
	//서비스 부분
	@Autowired
	private GroupService2 groupService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ServletContext servletContext;
	
	//로그
	private static final Logger logger = LoggerFactory.getLogger(GroupController2.class);
	

	@RequestMapping(method = RequestMethod.GET)
	public String mvPageRecommend() {
		return "group2/grouplist2";
	}
	
	@RequestMapping(value = "/grouplist2", method = RequestMethod.GET)
	public String grouprecommend(Model model, HttpSession session) {
//		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		UserDto userDto= new UserDto();
		userDto.setUserId("hth0893@naver.com");
		
		userDto = memberService.getUser(userDto);
		session.setAttribute("userInfo", userDto);
	
		
		Map<String, Object> parameter = new HashMap<String, Object>();
		System.out.println();
//		parameter.put("page", "1");
		if(userDto != null) {
			parameter.put("userDto", userDto);
		}else {
			parameter.put("userDto", "");
		}
		model.addAttribute("parameter", parameter);
//		parameter.put("key", "");
//		parameter.put("word", "");
//		parameter.put("isMyGroup", "");
//		parameter.put("groupCategoryNum", "0");
		
		//System.out.println(parameter);
		Map<String, Object> recommendParamMap = new HashMap<String, Object>();
		recommendParamMap.put("page", "1");
		recommendParamMap .put("userDto",userDto);
		List<GroupDto> groupList = groupService.getRecommendGroupList(recommendParamMap );
		//System.out.println("size : " + size);
		
		

//		model.addAttribute("size", size);
		model.addAttribute("parameter", parameter);
		model.addAttribute("groupList", groupList);
		return "group2/grouplistresult2";
	}


	
}
