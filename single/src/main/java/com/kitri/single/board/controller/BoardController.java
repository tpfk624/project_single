package com.kitri.single.board.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kitri.single.board.model.BoardDto;
import com.kitri.single.board.model.BoardPageDto;
import com.kitri.single.board.service.BoardService;
import com.kitri.single.board.service.ReplyService;
import com.kitri.single.common.service.CommonService;
import com.kitri.single.user.model.UserDto;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	//로그
	//private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private ReplyService replyService;
	
	@Autowired
	private CommonService commonService;
	
	
	
	
	
	
	
	
	@RequestMapping("singlemain")
	public String singleMain(Model model){
		//System.out.println("main으로 가는중");
		//select를 3번해와야뎀.
		
		//이달의 자취왕
		
		//이주의 추천순
		List<BoardDto> boardDtoList = boardService.weekList();
		//System.out.println(boardDtoList.toString());
		model.addAttribute("weekList", boardDtoList);
		
		String path = "board/singlemain";
		
		return path;
		
	}
	
	
	
	// 자취생활 페이지로 이동
	@RequestMapping(value="/singlelifeboard")
	public void singlelifeboard(){
	}
	// 요리 레시피 페이지로 이동
	@RequestMapping(value="/singlecookboard")
	public void singlecookboard(){
	}
	// 글 작성후 자취 or 요리 페이지로 이동
	@RequestMapping(value="/list")
	public String list(@RequestParam Map<String, String> parameter, 
			Model model){
		
		int boardListNum = Integer.parseInt(parameter.get("boardListNum")); 
		
		String path = "";

		if (boardListNum != 0) {
			if (boardListNum == 1) {
				path = "board/singlelifeboard";
			}else if (boardListNum == 2) {
				path = "board/singlecookboard";
			}
		}else {
			path = "redirect:/index.jsp";
		}
		
		
				
		return path;
	}
	
	
	
	
	// write 페이지 이동
	@RequestMapping(value="/write",method = RequestMethod.GET)
	public String write(@RequestParam("boardListNum") int boardListNum, Model model
			, HttpSession session){

		UserDto userdto = (UserDto)session.getAttribute("userInfo");
		String path = "";
		
		if (userdto != null) {
			
			BoardPageDto bp = new BoardPageDto();
			bp.setBoardListNum(boardListNum);
			
			model.addAttribute("bp", bp);
			
			path = "board/write";
		} else {
			path = "redirect:/index.jsp";
		}
		
		return path;
	}
	
	
	
	
	@RequestMapping(value="/write",method = RequestMethod.POST)
	public String write(@RequestParam("tags") String tags,
			@RequestParam Map<String, String> parameter,
			Model model, HttpSession session){
		
		String path = "";
		
		// 오라클이랑 인덱스에 인클루드한것중 유저인포 넣어둔것 있음. 당연히 null아님? 근데도 들어가짐.
		// 혹시 new도 생성이기는 하니깐?
		//UserDto userdto = new UserDto();
		
		UserDto userdto = (UserDto)session.getAttribute("userInfo");
		BoardDto boardDto = new BoardDto();
		
		if (userdto != null) {
			// 2번 적용됨?? - 오라클에 있는 유저랑 인클루드해서 넣어둔 유저랑 겹처서 그런가?

			//System.out.println(" seq : 1 = "+seq);
			//int boardNum = commonService.getNextSeq();
			
			//boardDto.setBoardNum(boardNum);
			boardDto.setBoardListNum(Integer.parseInt(parameter.get("boardListNum")));
			boardDto.setUserId(userdto.getUserId());
			boardDto.setUserNickname(userdto.getUserNickname());
			boardDto.setBoardSubject(parameter.get("boardSubject"));
			boardDto.setBoardContent(parameter.get("boardContent"));
			boardDto.setBoardViews(0);
			boardDto.setBoardLike(0);
			
			//System.out.println("boardDto = " + boardDto);
			//System.out.println(" seq : 2 = "+seq);

			
			// 해시태그 dto에 넣어주기.
			String[] hashtags = tags.split("#");
			List<String> hashtagList = new ArrayList<>();
			
			for(int i=0 ; i<hashtags.length ; i++) {
				
				hashtagList.add(hashtags[i]);
				//System.out.println(hashtags[i]);
				
			}

			boardDto.setHashtagList(hashtagList);
			

			
			// 결과값 반환
			int boardNum = boardService.writeArticle(boardDto);
			
			if (boardNum != 0) {
				model.addAttribute("boardNum",boardNum);
				path = "board/write/writeok";
			} else {
				path = "board/write/writefail";
			}
			
		}
		
		model.addAttribute("parameter",parameter);
		
		return path;
		
	}
	
	
	
	@RequestMapping(value="/view",method = RequestMethod.GET)
	public String view(@RequestParam("boardNum") int boardNum, @RequestParam Map<String, String> parameter, 
			Model model, HttpSession session) { 
		
		
		UserDto userDto = (UserDto)session.getAttribute("userInfo");
		String path = "";
		
		
		// if문으로 로그인 했는지 안했는지 체크하기
		if (userDto != null) {
			BoardDto boardDto = boardService.viewArticle(boardNum);
			
//			System.out.println("boardDto ==== " + boardDto);
//			System.out.println("parameter ==== " + parameter);
			
			model.addAttribute("article", boardDto);
			
			// ????
			model.addAttribute("parameter", parameter);
			
			path = "board/singleview";
		
		} else {
			path = "redirect:/index.jsp";
		}
		
		return path;

	}
	
	// 전체 페이징 처리
	@RequestMapping(method = RequestMethod.GET)
	public String boardList(@RequestParam Map<String, Object> params, Model model) {
		
		//System.out.println("컨트롤");
		int currentPage = Integer.parseInt((String)params.get("page"));
		// boardListNum로 나눔.
		int boardListNum = Integer.parseInt((String)params.get("boardListNum"));
		String key = (String)params.get("key");
		String word = (String)params.get("word");
		
		BoardPageDto bp = boardService.selectBoardList(currentPage, boardListNum, key, word);
		
		model.addAttribute("bp", bp);
		
		String path = "";
		
		if (boardListNum == 0) {
			path = "board/boardlist/newlistok";
		} else {
			path = "board/boardlist/commonlist";
		}
		model.addAttribute("root", servletContext.getContextPath());
		
		return path;
	}
	
	
	
	
	

}









