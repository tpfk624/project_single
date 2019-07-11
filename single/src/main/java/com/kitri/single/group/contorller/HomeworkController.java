package com.kitri.single.group.contorller;

import java.util.Collection;
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
import org.springframework.web.servlet.ModelAndView;

import com.kitri.single.group.model.HomeworkDto;
import com.kitri.single.group.service.HomeworkService;
import com.kitri.single.user.model.UserDto;

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
		
		UserDto userInfo = (UserDto)session.getAttribute("userInfo");
		if(userInfo == null) {
			model.setViewName("/member/login");
			return model;
		}
		
		parameter.put("userId", userInfo.getUserId());
		
		logger.info(parameter.toString());
		
		List<HomeworkDto> list = homeworkService.getHomeworkList(parameter);
		model.addObject("homeworkList", list);
		model.addObject("root", servletContext.getContextPath());
		model.addObject("parameter", parameter);
		model.setViewName("/group/homeworkresult");
		
		logger.info(list.toString());
		
		return model;
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
