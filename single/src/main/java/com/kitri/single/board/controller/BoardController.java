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
		//write?bcode=${board.bcode}&pg=1&key=&word=  가지고 다녀야 하는 이유는 계속 그 게시판을 유지해야뎀 안하면 실행 안뎀.
		//System.out.println("writepage로 가는중");

		model.addAttribute("parameter", parameter);
		
		//select를 3번해와야뎀. ---------------
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
