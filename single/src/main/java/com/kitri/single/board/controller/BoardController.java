package com.kitri.single.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("singleuser")
public class BoardController {
	
	@RequestMapping("singlemain")
	public void newContent(){
		System.out.println("main으로 가는중");
		//select를 3번해와야뎀.
		
		//이달의 자취왕
		
		//이달의 추천순
		
		//오늘의 새글
		
	}

}
