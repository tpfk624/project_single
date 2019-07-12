package com.kitri.single.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kitri.single.board.model.BoardDto;
import com.kitri.single.board.model.BoardPageDto;
import com.kitri.single.board.model.ReplyDto;
import com.kitri.single.board.service.BoardService;
import com.kitri.single.board.service.ReplyService;
import com.kitri.single.common.service.CommonService;
import com.kitri.single.user.model.UserDto;

@Controller
@RequestMapping("/board")
@SessionAttributes("userInfo") // @ModelAttribute("userInfo") UserDto userDto 빼올때 session것을 가져오라는 뜻.
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
		//select를 3번해와야뎀.
		
		//이달의 자취왕
		
		//이주의 추천순
		List<BoardDto> boardDtoList = boardService.weekList();
		model.addAttribute("weekList", boardDtoList);
		
		String path = "board/singlemain";
		
		return path;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 단순 글쓰기 ajax
	@RequestMapping(value="/answerwritepage")
	public String answerok(){
		return "board/write/answerwrite";
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
			, @ModelAttribute("userInfo") UserDto userDto){

			
		BoardPageDto bp = new BoardPageDto();
		bp.setBoardListNum(boardListNum);
		
		model.addAttribute("bp", bp);
		
		String path = "board/write";

			
		return path;
	}
	
	
	
	
	@RequestMapping(value="/write",method = RequestMethod.POST)
	public String write(@RequestParam("tags") String tags,
			@RequestParam Map<String, String> parameter,
			Model model, @ModelAttribute("userInfo") UserDto userDto){
		
		String path = "";
		
		// 오라클이랑 인덱스에 인클루드한것중 유저인포 넣어둔것 있음. 당연히 null아님? 근데도 들어가짐.
		// 혹시 new도 생성이기는 하니깐?
		//UserDto userdto = new UserDto();
		
		
		BoardDto boardDto = new BoardDto();
		
		if (userDto != null) {
			// 2번 적용됨?? - 오라클에 있는 유저랑 인클루드해서 넣어둔 유저랑 겹처서 그런가?

			//int boardNum = commonService.getNextSeq();
			
			//boardDto.setBoardNum(boardNum);
			boardDto.setBoardListNum(Integer.parseInt(parameter.get("boardListNum")));
			boardDto.setUserId(userDto.getUserId());
			boardDto.setUserNickname(userDto.getUserNickname());
			boardDto.setBoardSubject(parameter.get("boardSubject"));
			boardDto.setBoardContent(parameter.get("boardContent"));
			boardDto.setBoardViews(0);
			boardDto.setBoardLike(0);
			
			// 해시태그 dto에 넣어주기.
			String[] hashtags = tags.split("#");
			List<String> hashtagList = new ArrayList<>();
			
			for(int i=0 ; i<hashtags.length ; i++) {
				
				hashtagList.add(hashtags[i]);
				
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
	public String view(@RequestParam Map<String, String> parameter, 
			Model model) { 
		
		// 바로 접속하려 할때.
		if(parameter == null || parameter.get("boardNum") == null) {
			return "redirect:/index.jsp";
		}
		
		int boardNum = Integer.parseInt(parameter.get("boardNum"));
		
		// if문으로 로그인 했는지 안했는지 체크하기
		BoardDto boardDto = boardService.viewArticle(boardNum);
		System.out.println(boardDto);
		
		model.addAttribute("article", boardDto);
		
		// ????
		model.addAttribute("parameter", parameter);
		
		String path = "board/singleview";
		
		
		return path;

	}
	
	
	
	
	// 전체 페이징 처리
	@RequestMapping(method = RequestMethod.GET)
	public String boardList(@RequestParam Map<String, Object> params, Model model) {
		
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
	
	
	
	
	
	// 답변 글들 보여주기.
	@RequestMapping("/answerview")
	public String answerView(@RequestParam("boardNum") int boardNum, Model model,
			HttpSession session) {
		
		List<ReplyDto> answerList = new ArrayList<ReplyDto>();
		UserDto userDto = (UserDto)session.getAttribute("userInfo");
		
		if (userDto != null) {
			model.addAttribute("userInfo", userDto);
		}
		
		BoardDto boardDto = new BoardDto();
		boardDto.setBoardNum(boardNum);
		
		answerList = replyService.answerView(boardDto);
		
		model.addAttribute("answerList", answerList);
		
		String path = "board/write/answerview";
		
		return path;
	}
	
	// 답변 쓰기.
	@RequestMapping("/answerwrite")
	public @ResponseBody String answerwrite(@RequestParam Map<String, Object> params
			, Model model, @ModelAttribute("userInfo") UserDto userDto) {
		
		ReplyDto replyDto = new ReplyDto();
		
		String userId = userDto.getUserId();
		String userNickname = userDto.getUserNickname();
		String replyContent = (String)params.get("replyContent");
		int boardNum = Integer.parseInt((String)params.get("boardNum"));
		
		replyDto.setUserId(userId);
		replyDto.setUserNickname(userNickname);
		replyDto.setReplyContent(replyContent);
		replyDto.setBoardNum(boardNum);
		
		//List<ReplyDto> list = replyService.answerview(replyDto);
		
		//model.addAttribute("list", list);
		int seq = replyService.answerInsert(replyDto);
		
		JSONObject jsonObject = new JSONObject();
		
		if (seq == 0) {
			jsonObject.put("resultCode", 0);
			//jsonObject.put("resultData", "시스템 에러");
		}else {
			jsonObject.put("resultCode", 1);
			//jsonObject.put("resultData", "성공");
		}
		
		
		return jsonObject.toString();
	}
	
	// 답변 삭제
	@RequestMapping(value ="/delete")//, method = RequestMethod.DELETE
	public @ResponseBody String answerDelete(@RequestParam("replyNum") int replyNum
			, Model model, @ModelAttribute("userInfo") UserDto userDto) {
		
		
		int seq = replyService.answerDelete(replyNum);
		
		JSONObject jsonObject = new JSONObject();
		
		if (seq == 0) {
			jsonObject.put("resultCode", 0);
		}else {
			jsonObject.put("resultCode", 1);
		}
		
		return jsonObject.toString();
		
	}
	
	
	// 좋아요
	@RequestMapping(value = "/like", method = RequestMethod.POST)
	public @ResponseBody String like(@RequestBody Map<String, Integer> mapBN
			, Model model, HttpSession session) {
		
		UserDto userDto = (UserDto)session.getAttribute("userInfo");
		JSONObject jsonObject = new JSONObject();
		
		int boardNum = mapBN.get("boardNum");
		System.out.println(boardNum);
		
		if (userDto != null) {
			
			String userId = userDto.getUserId();

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("userId", userId);
			map.put("boardNum", boardNum);
			
			
			int seq = replyService.like(map);
			System.out.println("seq  ==  " + seq);
			
			if (seq == 0) {
				// 서버 오류로 좋아요가 실패했습니다. 다시 시도해 주세요.
				jsonObject.put("resultCode", 2);
			} else {
				jsonObject.put("resultCode", 1);
			}
			
		} else {
			
			// 로그인 해달라고 모달창 띄워주기
			jsonObject.put("resultCode", 0);
			
		}
		
		
		return jsonObject.toString();
	}
	
	
	
	

}









