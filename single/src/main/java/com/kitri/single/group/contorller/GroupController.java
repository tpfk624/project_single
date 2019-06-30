package com.kitri.single.group.contorller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kitri.single.group.model.GroupDto;
import com.kitri.single.group.service.GroupService;
import com.kitri.single.user.model.UserDto;

@Controller
@RequestMapping("group")
@SessionAttributes("userInfo")
public class GroupController {
	
	//서비스 부분
	@Autowired
	private GroupService groupService;
	
	//로그
	private static final Logger logger = LoggerFactory.getLogger(GroupController.class);
	
	@RequestMapping(value = "grouplist", method = RequestMethod.GET)
	public void grouplist(Model model, HttpSession session) {
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		
		List<GroupDto> list = groupService.getGroupList(userInfo);
		int size = list.size();
		
		model.addAttribute("size", size);
		model.addAttribute("groupList", list);
		logger.info(list.toString());
		logger.info("size : " + size);
	}
	
}
