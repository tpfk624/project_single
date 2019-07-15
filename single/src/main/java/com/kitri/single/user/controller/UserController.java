package com.kitri.single.user.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.bind.annotation.SessionAttribute;

import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.kitri.single.board.model.BoardDto;
import com.kitri.single.group.dao.GroupDao;
import com.kitri.single.group.model.GroupDto;
import com.kitri.single.group.model.GroupMemberDto;
import com.kitri.single.group.service.GroupService;
import com.kitri.single.member.service.MemberService;
import com.kitri.single.user.model.UserDto;

import com.kitri.single.user.service.UserService;
import com.kitri.single.util.SiteConstance;
import com.kitri.single.util.Utill;

@Controller
@RequestMapping("/mypage")
@SessionAttributes("userInfo")
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private GroupService groupService;

	@Autowired
	private ServletContext servletContext;

	// 로그
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	private static final String groupMemberDto = null;

	

	//////////////////////////////////내정보 수정 페이지////////////////////////////////////////////////
	
	//회원 상세 정보 조회
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String home(@ModelAttribute("userInfo") UserDto userInfo ,String userId, Model model, HttpSession session) {
		System.out.println("home 들어옴");
	
		//UserDto userInfo = (UserDto) session.getAttribute("userInfo");// 여기에다가 서비스통해서 userdto를 db에담고 그걸 모델에 담아서 select 홈안에 모델메개변수 잡아주기
		System.out.println(userInfo);
		
		String id = userInfo.getUserId();
		UserDto getuser = userService.userInfom(id);
		
		model.addAttribute("userInfos", getuser); // 모델안에 애드어트리뷰트 하고 화면단에뿌려주기
		
		return "mypage/mypage";
	}
	
	
	//회원 정보 수정
	@ResponseBody
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(UserDto userDto, Model model,
			HttpSession session, //ajax는 답변을 기다려서 @ModelAttribute를 쓰면 안됨
			@RequestParam("imgdata") MultipartFile multipartFile ) { //사진정보 파일을 얻음 
		 
		
		UserDto userInfo = (UserDto) session.getAttribute("userInfo"); 
		
		if (userInfo == null) {
			JSONObject json = new JSONObject();
			json.put("code", 99);
			json.put("result", "로그인이 풀렸습니다. 다시 로그인해주세요");
			return json.toString();
		}
		
		System.out.println("userDto입니당: " + userDto);
		System.out.println("사진파일입니다: " + multipartFile);
		System.out.println("회원 정보 수정 여기까지 들어오니");
		
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
		
		UserDto userdto = userService.userModify(userDto);
		
		model.addAttribute("userInfo", userDto);
		
		JSONObject json = new JSONObject();
		json.put("code", 1);
		json.put("result", "회원정보가 정상적으로 수정되었습니다");

		return json.toString();
	}
	


	// 탈퇴하기
	@RequestMapping("/userdelete")
	public String userdelete(@ModelAttribute("userInfo") UserDto userInfo
			, String userId, Model model, HttpSession session, SessionStatus sessionStatus) {
		System.out.println("탈퇴하기 컨트롤러 들어옴 userInfo : " + userInfo);
		
		String id = userInfo.getUserId();
		
		GroupMemberDto groupMemberDto = new GroupMemberDto();
		groupMemberDto.setGroupMemberStatecode("D");
		groupMemberDto.setUserId(id);
		
		groupService.fireGroupMember(groupMemberDto);
		userService.userDelete(id);

		sessionStatus.setComplete();
		return "redirect:/index.jsp";
		
	}
		
		
		
	
	//////////////////////////////////모임관리 페이지////////////////////////////////////////////////

	//모임불러오기(모든모임 첫페이지용) 
	@RequestMapping(value = "/groupall", method = RequestMethod.GET)
	public String groupall(@ModelAttribute("userInfo") UserDto userInfo, Model model, HttpSession session) {
		
		System.out.println("모임 첫페이지옴");
		
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
	public String groupSelect(@ModelAttribute("userInfo") UserDto user, 
			@RequestParam(name = "option") String option, Model model) {
		System.out.println("option : " + option);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", user.getUserId());
		map.put("option", option);
		
		List<GroupDto> list = userService.getMyGroup(map);
		model.addAttribute("groupList", list);
		
		return "/mypage/groupresult" ;
	}

	//모임 디테일
	@RequestMapping(value = "/groupdetail", method = RequestMethod.GET)
	public @ResponseBody String getGroup(@ModelAttribute("userInfo") UserDto user
			, @RequestParam(name = "groupNum") int groupNum){

		System.out.println("그룹디테일 컨트롤러 들어옴");
		
		GroupDto groupDto = userService.getGroup(groupNum);
		
		JSONObject jsonObject = new JSONObject();
		
		JSONObject groupJson = new JSONObject(groupDto);
		jsonObject.put("group", groupJson);
		jsonObject.put("taglist", groupDto.getHashtagList());
		
		
		return jsonObject.toString();
	}
	
	
	//모임 탈퇴
	@ResponseBody
	@RequestMapping("/moimdelete")
	public String moimdelete(HttpSession session, @RequestParam("groupNum") int groupNum) {
		
		System.out.println("모임 탈퇴 컨트롤러 들어옴");
		
		UserDto userInfo = (UserDto)session.getAttribute("userInfo");
		if(userInfo == null) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("resultCode", 99);
			jsonObject.put("resultData", "로그인이 필요한 기능입니다.");
			return jsonObject.toString();
		}
		
		String json = makeJSON(0, "찜하기 취소 실패하였습니다. 관리자에게 문의하세요");
		if(groupNum != 0) {
			json = userService.fireGroupMember(userInfo.getUserId(), groupNum);
		}
		return json;
	}
	
	
	
	//////////////////////////////////찜한 모임관리 페이지////////////////////////////////////////////////
	
	//찜모임불러오기(찜 모든모임 첫페이지용) 
	@RequestMapping(value = "/stampgroup", method = RequestMethod.GET)
	public String stampgroup(@ModelAttribute("userInfo") UserDto user, Model model, HttpSession session) {
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
	public String zselect(@ModelAttribute("userInfo") UserDto user, 
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
	@ResponseBody
	@RequestMapping("/stampdelete")
	public String stampdelete(HttpSession session, @RequestParam("groupNum") int groupNum) {
		
		System.out.println("찜한 모임 취소 컨트롤러 들어옴");
		UserDto userInfo = (UserDto)session.getAttribute("userInfo");
		if(userInfo == null) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("resultCode", 99);
			jsonObject.put("resultData", "로그인이 필요한 기능입니다.");
			return jsonObject.toString();
		}
		
		String json = makeJSON(0, "찜하기 취소 실패하였습니다. 관리자에게 문의하세요");
		if(groupNum != 0) {
			json = userService.stampDelete(userInfo.getUserId(), groupNum);
		}
		return json;
	}
	
	
	
	//////////////////////////////////게시물 관리 페이지////////////////////////////////////////////////
		
	//게시물 불러오기(내가 쓴 글) 
	@RequestMapping(value = "/writelist", method = RequestMethod.GET)
	public String writelist(@ModelAttribute("userInfo") UserDto userInfo, Model model, HttpSession session) {
		
		System.out.println("게시물 첫페이지옴");
		
		Map<String, String> parameter = new HashMap<String, String>();
		
		if (userInfo != null) {
			parameter.put("userId", userInfo.getUserId());
		}

		List<BoardDto> list = userService.getBoardAll(parameter);
		
		int size = list.size();
		System.out.println("게시물 파라미터" + parameter);
		
		model.addAttribute("parameter", parameter);
		model.addAttribute("size", size);
		model.addAttribute("boardList", list);
		
		return "/mypage/writelist" ;
	}
	
	//게시물 불러오기(나의 댓글 /찜한 글) 
	@RequestMapping("/writeother")
	public String writeother(@ModelAttribute("userInfo") UserDto user, 
			@RequestParam(name = "option") String option, Model model) {
		
		System.out.println("모임 두번째 페이지옴");
		System.out.println("option : " + option);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", user.getUserId());
		map.put("option", option);
		
		List<BoardDto> list = userService.getBoardOther(map, option);
		model.addAttribute("boardList", list);
		model.addAttribute("root", servletContext.getContextPath());
		
		return "/mypage/writelistresult" ;
	}
		

	//json데이터 생성
	public String makeJSON(int resultCode, Object resultData) {
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("resultCode", resultCode);
		if(resultData instanceof Collection) {
			jsonObject.put("resultData", new JSONArray(resultData));
		}else if(resultData instanceof String){
			jsonObject.put("resultData", resultData.toString());
		}else {
			jsonObject.put("resultData", new JSONObject(resultData));
		}
		
		return jsonObject.toString();
		
	}
	
}







