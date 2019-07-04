package com.kitri.single.group.contorller;

import java.io.File;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.kitri.single.group.model.GroupDto;
import com.kitri.single.group.service.GroupService;
import com.kitri.single.user.model.UserDto;
import com.kitri.single.util.Utill;

@Controller
@RequestMapping("/group")
@SessionAttributes("userInfo")
public class GroupController {
	
	//서비스 부분
	@Autowired
	private GroupService groupService;
	
	@Autowired
	private ServletContext servletContext;
	
	//로그
	private static final Logger logger = LoggerFactory.getLogger(GroupController.class);
	
	//첫페이지용
	@RequestMapping(method = RequestMethod.GET)
	public String grouplist(Model model, HttpSession session) {
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		Map<String, String> parameter = new HashMap<String, String>();
		parameter.put("page", "1");
		if(userInfo != null) {
			parameter.put("userId", userInfo.getUserId());
		}
		parameter.put("groupNum", null);
		parameter.put("key", null);
		parameter.put("word", null);
		
		List<GroupDto> list = groupService.getGroupList(parameter);
		int size = list.size();
		
		System.out.println(parameter);
		model.addAttribute("parameter", parameter);
		model.addAttribute("size", size);
		model.addAttribute("groupList", list);
		
		return "group/grouplist";
	}
	
	@RequestMapping(value = "/groupdetail", method = RequestMethod.GET)
	public @ResponseBody String groupDetail(@RequestParam(name = "groupNum") int groupNum){
		//String json = groupService.getGrou(parameter);
		//System.out.println(groupNum);
		String json = groupService.getGroupDetail(groupNum);
		//System.out.println(json);
		return json;
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public void groupCreate(@SessionAttribute("userInfo") UserDto userInfo) {
		
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public @ResponseBody String groupCreate(
			GroupDto groupDto
			, @SessionAttribute("userInfo") UserDto userInfo
			, @RequestParam("imgdata") MultipartFile multipartFile
			, @RequestParam("groupHashtag") String groupHashtag) {
		
		System.out.println(groupDto);
		System.out.println(multipartFile);
		System.out.println(multipartFile.isEmpty());
		if(multipartFile != null && !multipartFile.isEmpty()) {
			
			String realPath = servletContext.getRealPath("");
			
			String src = "";
			try {
				src = Utill.profileUpload(multipartFile, "group", realPath);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			groupDto.setGroupImgSrc(src);
			groupDto.setGroupMemberCount(1);
			
			//서비스 시작...
			int groupNum = groupService.createGroup(groupDto, userInfo, groupHashtag);
			
			System.out.println(groupNum);
		}
		
		return "";
	}
}
