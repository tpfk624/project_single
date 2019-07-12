package com.kitri.single.group.contorller;

import java.io.File;
import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.single.group.model.CalendarDto;
import com.kitri.single.group.model.GroupDto;
import com.kitri.single.group.model.GroupMemberDto;
import com.kitri.single.group.service.GroupService;
import com.kitri.single.user.model.UserDto;
import com.kitri.single.util.SiteConstance;
import com.kitri.single.util.Utill;

@Controller
//@RequestMapping("/group2")
@SessionAttributes(names = {"userInfo"})
public class GroupController2 {
	
	//서비스 부분
	@Autowired
	private GroupService groupService;
	
	@Autowired
	private ServletContext servletContext;
	
	//로그
	private static final Logger logger = LoggerFactory.getLogger(GroupController2.class);
	
	//첫페이지용
	@RequestMapping(method = RequestMethod.GET)
	public String group(Model model, HttpSession session) {
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		Map<String, String> parameter = new HashMap<String, String>();
		parameter.put("page", "1");
		if(userInfo != null) {
			parameter.put("userId", userInfo.getUserId());
		}else {
			parameter.put("userId", "");
		}
		parameter.put("key", "");
		parameter.put("word", "");
		parameter.put("isMyGroup", "");
		parameter.put("groupCategoryNum", "0");
		
		//System.out.println(parameter);
		int size = groupService.getGroupConunt(parameter);
		//System.out.println("size : " + size);
		
		
		model.addAttribute("parameter", parameter);
		model.addAttribute("size", size);
		
		return "group/grouplist2";
	}
//	@RequestMapping(value = "/grouprecomandlist", method = RequestMethod.GET)
	public String getGroupList(@RequestParam Map<String, String> parameter, HttpSession session, Model model) {
		UserDto user = (UserDto)session.getAttribute("userInfo");
		if(user != null) {
			parameter.put("userId", user.getUserId());
		}else {
			parameter.put("userId", "");
		}
		
		//System.out.println(parameter);
		logger.info(parameter.toString());
		
		List<GroupDto> groupList = groupService.getGroupList(parameter);
		model.addAttribute("groupList", groupList);
		//System.out.println(json);
		
		return "group/grouplistresult";
	}
	
}
