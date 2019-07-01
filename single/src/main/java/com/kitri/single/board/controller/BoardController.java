package com.kitri.single.board.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kitri.single.board.model.ReplyDto;
import com.kitri.single.board.service.BoardService;
import com.kitri.single.common.service.CommonService;
import com.kitri.single.user.model.UserDto;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private CommonService commonService;
	
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
		
		
		
	}
	
	
	@RequestMapping(value="/write",method = RequestMethod.POST)
	public String write(ReplyDto replyDto,@RequestParam Map<String, String> parameter,
			Model model, HttpSession session){
		//System.out.println("write insert 하는중");
		
		String path = "";
		
		// 오라클이랑 인덱스에 인클루드한것중 유저인포 넣어둔것 있음. 당연히 null아님? 근데도 들어가짐.
		// 혹시 new도 생성이기는 하니깐?
		//UserDto userdto = new UserDto();
		UserDto userdto = (UserDto)session.getAttribute("userInfo");
		if (userdto != null) {
			// 2번 적용됨?? - 오라클에 있는 유저랑 인클루드해서 넣어둔 유저랑 겹처서 그런가?
			int seq = commonService.getNextSeq();
			System.out.println(seq);
			
			replyDto.setBoardNum(seq);
			replyDto.setUserId(userdto.getUserId());
			replyDto.setUserNickname(userdto.getUserNickname());
			
			// 여기서부터임.
			seq = boardService.writeArticle(replyDto);
		}
		
		//model.addAttribute("",);
		
		return path;
		
	}
	
	

}
