//package com.kitri.single.user.controller;
//
//import java.io.IOException;
//
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.SessionAttribute;
//import org.springframework.web.multipart.MultipartFile;
//
//import com.kitri.single.user.model.UserDto;
//import com.kitri.single.util.Utill;
//
//public class TestController {
//
//	
//	
//	// 정보수정하기
//		@RequestMapping(value="/modify", method = RequestMethod.POST)
//		public String modify(MemberDto memberDto,
//							  @ModelAttribute("userInfo") MemberDto membercurrentDto,
//							  @RequestParam("profile_file") MultipartFile multipartFile,
//							  Model model) {
//			System.out.println("member_c : 정보수정하기 메소드 들어옴");
//			
//			// 프로필 사진이 있는 경우,
//			if(multipartFile != null && !multipartFile.isEmpty()) {
//				String orignPicture = multipartFile.getOriginalFilename();
//				String realPath = servletContext.getRealPath("/upload/member");
//						
//				File dir = new File(realPath);
//				if(!dir.exists()) {
//					dir.mkdirs();
//				}
//						
//				String savePicture = UUID.randomUUID().toString() + orignPicture.substring(orignPicture.lastIndexOf("."));
//				File file = new File(realPath, savePicture);
//
//				memberDto.setProfile(savePicture); // memberDto에 '사진명.jpg'을 세팅함
//						
//				try {
//							
//					multipartFile.transferTo(file); // multipartFile의 파일을 file로 옮김
//							
//				} catch (IllegalStateException e) {
//							e.printStackTrace();
//				} catch (IOException e) {
//							e.printStackTrace();
//				}
//			} else { // 프로필 사진이 없는 경우,
//				// 수정을 안하는 경우. 냅둔다.
//				memberDto.setProfile(membercurrentDto.getProfile());
//			}
//			
//			memberService.modify(memberDto);
//			
//			model.addAttribute("userInfo", memberDto);
//			
//			return "member/mypage";
//			
//		}
//		
//}
//
//
//
//
////회원 정보 수정
//	@RequestMapping(value = "/modify", method = RequestMethod.POST)
//	public String modify(UserDto userDto, Model model,
//			@SessionAttribute("userInfo") UserDto userInfo,
//			@RequestParam("imgdata") MultipartFile multipartFile ) { //사진정보 파일을 얻음 
//		
//		System.out.println(userDto);
//		System.out.println(multipartFile);
//		System.out.println("회원 정보 수정 여기까지 들어오니");
//		
//		if (multipartFile != null && !multipartFile.isEmpty()) {
//			
//			String realPath = servletContext.getRealPath("");
//			System.out.println(realPath);
//			String src = "";
//			try {
//				src = Utill.profileUpload(multipartFile, "user", realPath, servletContext.getContextPath());
//			} catch (IllegalStateException e) {
//				e.printStackTrace();
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//			userDto.setUserProfile(src);// 경로값
//			System.out.println(userDto);
//		}
//		return null;
//	}
//	
	
	
	