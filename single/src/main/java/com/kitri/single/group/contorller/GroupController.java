package com.kitri.single.group.contorller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;

import com.kitri.single.group.model.GroupDto;
import com.kitri.single.group.model.GroupMemberDto;
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
		
		return "group/grouplist";
	}
	
	@RequestMapping(value = "/grouplist", method = RequestMethod.GET)
	public String getGroupList(@RequestParam Map<String, String> parameter, HttpSession session, Model model) {
		UserDto user = (UserDto)session.getAttribute("userInfo");
		if(user != null) {
			parameter.put("userId", user.getUserId());
		}else {
			parameter.put("userId", "");
		}
		
		//System.out.println(parameter);
		
		
		List<GroupDto> groupList = groupService.getGroupList(parameter);
		model.addAttribute("groupList", groupList);
		//System.out.println(json);
		
		return "group/grouplistresult";
	}
	
	@RequestMapping(value = "/groupdetail", method = RequestMethod.GET)
	public @ResponseBody String getGroup(@RequestParam(name = "groupNum") int groupNum){
		//String json = groupService.getGrou(parameter);
		//System.out.println(groupNum);
		GroupDto groupDto = groupService.getGroup(groupNum);
		
		JSONObject jsonObject = new JSONObject();
		
		JSONObject groupJson = new JSONObject(groupDto);
		jsonObject.put("group", groupJson);
		jsonObject.put("taglist", groupDto.getHashtagList());
		
		return jsonObject.toString();
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
				src = Utill.profileUpload(multipartFile, "group", realPath, servletContext.getContextPath());
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			groupDto.setGroupImgSrc(src);
		}
		groupDto.setGroupMemberCount(1);
		//서비스 시작...
		String json = groupService.createGroup(groupDto, userInfo, groupHashtag);
		
		System.out.println(json);
	
		return json;

	}
	
	@RequestMapping("/{groupNum}")
	public String groupMain(@SessionAttribute("userInfo") UserDto userInfo
			, @PathVariable(name = "groupNum") int groupNum
			, Model model) {
		
		//그룹 멤버인지 확인
		String path = "group/grouplist";
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("userId", userInfo.getUserId());
		parameter.put("groupNum", groupNum);
		GroupMemberDto groupMemberDto = groupService.getGroupMember(parameter);
		
		//멤버의 상태에 따른 결정
		// L : 그룹장 Leader   
		// M : 그룹원 Member
		// W : 승인대기 Waiting
		if(groupMemberDto == null) {
			model.addAttribute("enteredGroupFail", "존재하지 않는 모임이거나 가입요청을 하지 않은 모임입니다.");
			path = "group/grouplist";
		}else if(groupMemberDto.getGroupMemberStatecode().equals("W")) {
			model.addAttribute("enteredGroupFail", "아직 모임장이 가입을 승인하지 않았습니다.");
			path = "group/grouplist";
		}else {
			GroupDto groupDto = groupService.getGroup(groupNum);
			if(groupDto == null) {
				model.addAttribute("enteredGroupFail", "모임이 존재하지 않습니다.");
				path = "group/grouplist";
			}else {
				model.addAttribute("group", groupDto);
				model.addAttribute("groupMember", groupMemberDto);
				path = "group/groupmain";
				
				logger.info(groupMemberDto.toString());
				logger.info(groupDto.toString());
			}	
		}
		
		//System.out.println(groupMemberDto);
		
		
		//그룹 멤버라면 그룹멤버정보및 그룹 메인화면 정보를 가져옴
		
		return path;
	}
}
