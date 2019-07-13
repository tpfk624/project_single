package com.kitri.single.group.contorller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.single.group.model.HProgressDto;
import com.kitri.single.group.model.HomeworkDto;
import com.kitri.single.group.service.HomeworkService;
import com.kitri.single.user.model.UserDto;
import com.kitri.single.util.Pagination;
import com.kitri.single.util.SiteConstance;
import com.kitri.single.util.Utill;

@RestController
@RequestMapping("/homework")
@SessionAttributes("userInfo")
public class HomeworkController {
	
	@Autowired
	private HomeworkService homeworkService;
	
	@Autowired
	private ServletContext servletContext;
	
	//로그
	private static final Logger logger = LoggerFactory.getLogger(GroupController.class);
	
	@RequestMapping(method = RequestMethod.POST)
	public String homeworkRegister(HttpSession session
			, HomeworkDto homeworkDto) {
		
		logger.info(homeworkDto.toString());
		
		String json = makeJSON(0, "잘못된 요청입니다.");
		UserDto userDto = (UserDto)session.getAttribute("userInfo");
		if(userDto == null) {
			json = makeJSON(99, "로그인이 풀렸습니다. 다시 로그인해주세요");
			return json;
		}
		
		int result = homeworkService.homeworkRegister(homeworkDto);
		if(result == 1) {
			json = makeJSON(1, "정상적으로 등록되었습니다");
		}
		
		return json.toString();
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView getHomeworkList(
			HttpSession session
			,@RequestParam Map<String, String> parameter
			, ModelAndView model) {
		
		model.setViewName("/group/homeworkresult");
		UserDto userInfo = (UserDto)session.getAttribute("userInfo");
		if(userInfo == null) {
			return model;
		}
		
		logger.info(parameter.toString());
		
		Pagination<HomeworkDto> pagination = homeworkService.getHomeworkList(parameter);
		pagination.setUrl(servletContext.getContextPath() + "/homework" );
		
		//model.addObject("homeworkList", list);
		model.addObject("pagination", pagination);
		model.addObject("root", servletContext.getContextPath());
		model.addObject("parameter", parameter);
		
		
		logger.info(pagination.toString());
		
		return model;
	}
	
	@RequestMapping("/homeworkdetail")
	public ModelAndView homeworkDetail(HttpSession session
			, HomeworkDto homeworkDto
			, ModelAndView model) {
		
		model.setViewName("group/grouphprogress");
		UserDto userInfo = (UserDto)session.getAttribute("userInfo");
		if(userInfo == null) {
			return model;
		}
		
		homeworkDto = homeworkService.getHomeworkDetail(homeworkDto.getHomeworkNum());
		model.addObject("homework", homeworkDto);
		model.addObject("root", servletContext.getContextPath());
		model.addObject("userNickname", userInfo.getUserNickname());
		logger.info(homeworkDto.toString());
		
		return model;
	}
	
	@RequestMapping(value = "/hprogress", method = RequestMethod.POST )
	public String hpCreate(HttpSession session
			, HProgressDto hProgressDto
			, @RequestParam(name = "filedata") MultipartFile multipartFile) {
		
		String json = makeJSON(0, "시스템 에러입니다");
		UserDto userInfo = (UserDto)session.getAttribute("userInfo");
		if(userInfo == null) {
			json = makeJSON(99, "로그인이 풀렸습니다. 다시 로그인해주세요");
			return json;
		}
		
		hProgressDto.setUserId(userInfo.getUserId());
		if(multipartFile != null && !multipartFile.isEmpty()) {
			String realPath = servletContext.getRealPath("");
			
			String src = "";
			try {
				src = Utill.profileUpload(multipartFile, "homework", realPath, servletContext.getContextPath());
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			hProgressDto.setHprogressFileOrigin(multipartFile.getOriginalFilename());
			hProgressDto.setHprogressFile(src);
		}else {
			if(hProgressDto.getHprogressFileOrigin() == null) {
				hProgressDto.setHprogressFileOrigin(null);
				hProgressDto.setHprogressFile(null);
			}
		}
		
		logger.info(hProgressDto.toString());
		int result = homeworkService.hpCreate(hProgressDto);
		if(result == 0) {
			json = makeJSON(2, "이미 등록한 글이 있습니다. 글을 수정해주세요");
		}else if(result == 1){
			json = makeJSON(1, "글이 등록되었습니다.");
		}
		
		return json;
	}
	
	@RequestMapping(value = "/hprogress", method = RequestMethod.GET)
	public String getHp(HttpSession session
			, HProgressDto hProgressDto ) {
		
		String json = makeJSON(0, "시스템 에러입니다");
		UserDto userInfo = (UserDto)session.getAttribute("userInfo");
		if(userInfo == null) {
			json = makeJSON(99, "로그인이 풀렸습니다. 다시 로그인해주세요");
			return json;
		}
		
		hProgressDto = homeworkService.getHp(hProgressDto);
		logger.info(hProgressDto.toString());
		json = makeJSON(1, hProgressDto);
		
		
		return json;
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
