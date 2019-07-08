package com.kitri.single.home.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.single.home.model.DustDto;
import com.kitri.single.home.service.HomeService;

@Controller
@RequestMapping("/home")
public class HomeController {
	
	@Autowired
	private HomeService homeService;
	
	//테스트용 사용안함
	@RequestMapping(value = "/dusttest", method = RequestMethod.GET)
	public String toDust() throws UnsupportedEncodingException {
		System.out.println("뜨거라!!!");
		return "home/dusttest";
	}
	
	//미세먼지 API통신
	//stationName : 장소
	//dataTerm : 데이터의 양 ('daily' : 오늘기준)
	@ResponseBody
	@RequestMapping(value = "/dusttest.do", method = RequestMethod.POST)
	public String dusttest(@RequestBody Map<String, String> map) throws UnsupportedEncodingException { //@RequestBody
		System.out.println("컨트롤러!!!");
		
		System.out.println("map >>>>> " + map);
		
		String json = homeService.dustFromOpenApi(map);
		
		return json;
	}
	
}
