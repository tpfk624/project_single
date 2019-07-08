package com.kitri.single.group.contorller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kitri.single.group.model.CalendarDto;
import com.kitri.single.group.service.GroupService;
import com.kitri.single.user.model.UserDto;

import sun.util.logging.resources.logging;

@RequestMapping("/calendar")
@RestController
@SessionAttributes("userInfo")
public class CalendarController {
	
	@Autowired
	private GroupService groupService;

	//로그
	private static final Logger logger = LoggerFactory.getLogger(GroupController.class);
	
	@RequestMapping(method = RequestMethod.POST)
	public String calendarCreate(@SessionAttribute("userInfo") UserDto userInfo
			, CalendarDto calendarDto
			, @RequestParam(name = "type") String type) {
		
		//System.out.println("POST : " + calendarDto);
		String json = "";
		if("create".equals(type)) {
			json = groupService.createCalendar(calendarDto);
		}else if("modify".equals(type)) {
			json = groupService.modifyCalendar(calendarDto);
		}
		 
		logger.info(json.toString());
		
		return json;
	}
	
	@RequestMapping(method = RequestMethod.DELETE)
	public String deleteCreate(@SessionAttribute("userInfo") UserDto userInfo
			, @RequestBody CalendarDto calendarDtol) {
		
		//System.out.println("DELETE : " + calendarDtol);
		String json = groupService.deleteCalendar(calendarDtol);
		logger.info(json.toString());
		
		return json;
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public String getCalendar(@SessionAttribute("userInfo") UserDto userInfo
			, @RequestParam Map<String, String> parameter) {
		
		//System.out.println(parameter);
		String json = "";
		if(parameter != null) {
			String tyep = parameter.get("type");
			
			if(tyep.equals("detail")) {
				json = groupService.getCalendar(parameter);
				
			}else if(tyep.equals("month")) {
				json = groupService.getCalendarList(parameter);
			}
		}
		//System.out.println(json);
		return json;
	}
	
	
}
