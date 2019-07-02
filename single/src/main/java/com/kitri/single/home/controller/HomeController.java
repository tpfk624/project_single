package com.kitri.single.home.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
	
	HomeService homeService;
	
	@RequestMapping(value = "/dusttest", method = RequestMethod.GET)
	public String toDust() throws UnsupportedEncodingException {
		System.out.println("뜨거라!!!");
		return "home/dusttest";
	}

	@ResponseBody
	@RequestMapping(value = "/dusttest.do", method = RequestMethod.GET)
	public Object dusttest(@RequestBody DustDto request) throws UnsupportedEncodingException { //@RequestBody
		System.out.println("컨트롤러!!!");
		
		String stationName = request.getStationName();
		String dataTerm = request.getDataTerm();
		Object response = homeService.dustFromOpenApi(stationName, dataTerm);
		
		return response;
	}
	
}
