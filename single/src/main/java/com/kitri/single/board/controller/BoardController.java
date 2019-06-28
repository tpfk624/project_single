package com.kitri.single.board.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kitri.single.board.model.BoardDto;

@Controller
@RequestMapping("board")
public class BoardController {
	
	@RequestMapping("singlemain")
	public void singleMain(){
//		System.out.println("main으로 가는중");
		//select를 3번해와야뎀.
		
		//이달의 자취왕
		
		
		//이달의 추천순
		
		//오늘의 새글
		
	}
	
	
	@RequestMapping(value="/write",method = RequestMethod.GET)
	public void write(@RequestParam Map<String, String> parameter, Model model){
		System.out.println("writepage로 가는중");
		//select를 3번해와야뎀.
		
		//이달의 자취왕
		
		//이달의 추천순
		
		//오늘의 새글
		
	}
	
	
	@RequestMapping(value="/write",method = RequestMethod.POST)
	public void write(BoardDto boardDto,@RequestParam Map<String, String> parameter,
			Model model, HttpSession session){
		System.out.println("write insert 하는중");
		//select를 3번해와야뎀.
		
		//이달의 자취왕
		
		//이달의 추천순
		
		//오늘의 새글
		
	}
	
	

}
