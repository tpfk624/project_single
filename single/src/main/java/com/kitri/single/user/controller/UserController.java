package com.kitri.single.user.controller;

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

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.bind.annotation.SessionAttribute;

import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.kitri.single.group.dao.GroupDao;
import com.kitri.single.group.model.GroupDto;
import com.kitri.single.group.service.GroupService;
import com.kitri.single.member.service.MemberService;
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

	

	//////////////////////////////////내정보 수정 페이지////////////////////////////////////////////////
	
	//회원상세정보 조회
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String home(String userId, Model model, HttpSession session) {
		System.out.println("home 들어옴");
	
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");// 여기에다가 서비스통해서 userdto를 db에담고 그걸 모델에 담아서 select 홈안에 모델메개변수 잡아주기
		System.out.println(userInfo);
		
		String id = userInfo.getUserId();
		UserDto getuser = userService.userInfom(id);
		
		model.addAttribute("userInfos", getuser); // 모델안에 애드어트리뷰트 하고 화면단에뿌려주기
		
		return "mypage/mypage";
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
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			userDto.setUserProfile(src);// 경로값
			System.out.println(userDto);
		}
		return null;
	}

	
	// 탈퇴하기
	@RequestMapping("/userdelete")
	public String userdelete(String userId, Model model, HttpSession session, SessionStatus sessionStatus) {
		System.out.println("탈퇴하기 컨트롤러 들어옴");
		
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");// 여기에다가 서비스통해서 userdto를 db에담고 그걸 모델에 담아서 select 홈안에 모델메개변수 잡아주기
		System.out.println(userInfo);
		
		String id = userInfo.getUserId();
		
		userService.userDelete(id);
		sessionStatus.setComplete();
		
		return "redirect:/index.jsp";
		
	}
		
		
		
	
	//////////////////////////////////모임관리 페이지////////////////////////////////////////////////

	//모임불러오기(모든모임 첫페이지용) 
	@RequestMapping(value = "/groupall", method = RequestMethod.GET)
	public String groupall(Model model, HttpSession session) {
		
		System.out.println("모임 첫페이지옴");
		
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		Map<String, String> parameter = new HashMap<String, String>();
		
		if (userInfo != null) {
			parameter.put("userId", userInfo.getUserId());
		}
		parameter.put("groupNum", null);

		List<GroupDto> list = userService.getGroupAll(parameter);
		
		int size = list.size();
		System.out.println(parameter);
		
		model.addAttribute("parameter", parameter);
		model.addAttribute("size", size);
		model.addAttribute("groupList", list);
		
		return "mypage/group";
	}
	
	//모임불러오기(모임장/모임원)
	@RequestMapping("/select")
	public String groupSelect(@SessionAttribute("userInfo") UserDto user, 
			@RequestParam(name = "option") String option, Model model) {
		System.out.println("option : " + option);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", user.getUserId());
		map.put("option", option);
		
		List<GroupDto> list = userService.getMyGroup(map);
		model.addAttribute("groupList", list);
		
		return "/mypage/groupresult" ;
	}

	//그룹디테일
	@RequestMapping(value = "/groupdetail", method = RequestMethod.GET)
	public @ResponseBody String getGroup(@RequestParam(name = "groupNum") int groupNum){
		//String json = groupService.getGrou(parameter);
		//System.out.println(groupNum);
		System.out.println("여기는 옴??");
		GroupDto groupDto = userService.getGroup(groupNum);
		
		JSONObject jsonObject = new JSONObject();
		
		JSONObject groupJson = new JSONObject(groupDto);
		jsonObject.put("group", groupJson);
		jsonObject.put("taglist", groupDto.getHashtagList());
		
		return jsonObject.toString();
	}
	
	//////////////////////////////////찜한 모임관리 페이지////////////////////////////////////////////////
	
	//찜모임불러오기(찜 모든모임 첫페이지용) 
	@RequestMapping(value = "/stampgroup", method = RequestMethod.GET)
	public String stampgroup(Model model, HttpSession session) {
		System.out.println("찜모임첫페이지");
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		
		Map<String, String> parameter = new HashMap<String, String>();
		if (userInfo != null) {
			parameter.put("userId", userInfo.getUserId());
		}
		
		parameter.put("groupNum", null);

		List<GroupDto> list = userService.getStampGroup(parameter);
		
		int size = list.size();
		System.out.println(parameter);
		
		model.addAttribute("parameter", parameter);
		model.addAttribute("size", size);
		model.addAttribute("groupList", list);
		
		return "mypage/groupzzim";
	}
	
	//모임불러오기(카테고리)
	@RequestMapping("/zselect")
	public String zselect(@SessionAttribute("userInfo") UserDto user, 
			@RequestParam(name = "option") String option, Model model) {
		System.out.println("option : " + option);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", user.getUserId());
		map.put("option", option);
		
		List<GroupDto> list = userService.getMyStamp(map);
		model.addAttribute("groupList", list);
		
		return "/mypage/groupresult" ;
	}

	
	//찜한 모임 취소
	@RequestMapping("/stampdelete")
	public void stampdelete (HttpSession session) {
		System.out.println("찜한 모임 취소 컨트롤러");
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		
		Map<String, String> parameter = new HashMap<String, String>();
		if (userInfo != null) {
			parameter.put("userId", userInfo.getUserId());
		}
		
		parameter.put("groupNum", null);

		List<GroupDto> list = userService.getStampGroup(parameter);

	}
	
//	@ResponseBody
//	@RequestMapping("/groupstamp")
//	public String groupStamp(@SessionAttribute("userInfo") UserDto userInfo
//				, @RequestParam("groupNum") int groupNum) {
//		logger.info("groupNum : " + groupNum);
//		String json = makeJSON(0, "찜하기 실패하였습니다. 관리자에게 문의하세요");
//		if(groupNum != 0) {
//			json = groupService.groupStamp(userInfo.getUserId(), groupNum);
//		}
//		logger.info(json);
//		return json;
//	}

}







