package com.kitri.single.user.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.kitri.single.user.model.UserDto;
import com.kitri.single.user.service.UserService;
import com.kitri.single.util.Utill;

@Controller

@SessionAttributes("userInfo")
@RequestMapping("/mypage")
public class UserController {

	
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ServletContext servletContext;
	
	
	@RequestMapping("/mypage")
	public void home(Model model, HttpSession session) {

		System.out.println("home 들어옴");
		//여기에다가 서비스통해서 userdto를 db에담고 그걸 모델에 담아서 select 홈안에 모델메개변수 잡아주기
		//모델안에 애드어트리뷰트 하고 화면단에뿌려주기
		String path = "";
		
		UserDto userDto = (UserDto) session.getAttribute("userinfo");
		
		model.addAttribute("userDto", userService.viewUser(session));
		model.addAttribute("article", userDto);

		
	}
	

	//수정
	@RequestMapping(value = "/modify" , method = RequestMethod.POST)
	public String modify(UserDto userDto
			, @SessionAttribute("userInfo") UserDto userInfo
			, @RequestParam("imgdata") MultipartFile multipartFile) { //사진정보 파일을 받음
		System.out.println(userDto);
		System.out.println(multipartFile);
		System.out.println("여기까지 들어오니");
		
		if (multipartFile != null && !multipartFile.isEmpty()) {
			
			String realPath = servletContext.getRealPath("");
			System.out.println(realPath);
			
			String src = "";
			try {
				src = Utill.profileUpload(multipartFile, "user", realPath);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			userDto.setUserProfile(src);//경로값
			System.out.println(userDto);
		}
		return null;
	}
	
	

 
}
