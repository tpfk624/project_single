package com.kitri.single.member.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kitri.single.member.dao.MemberDao;
import com.kitri.single.user.dao.UserDao;
import com.kitri.single.user.model.UserDto;



@Service
public class MemberServiceImpl implements MemberService {
	Logger logger= LoggerFactory.getLogger(MemberServiceImpl.class);
	
	@Autowired
	private JavaMailSender mailSender;	
	
	@Autowired
	private SqlSession sqlSession;

	
	@Override
	public void regist(UserDto userDto) {
		sqlSession.getMapper(MemberDao.class).regist(userDto);
	}

	@Override
	@Transactional
	public void sendAuthMail(String email) throws MessagingException, UnsupportedEncodingException {
		// 임의의 authkey 생성
		String authkey = new TempKey().getKey(50, false);
		
		logger.info("email"+ email);
		UserDto userDto = sqlSession.getMapper(MemberDao.class).getUser(email.trim());
		
		if(userDto == null) {
			logger.debug("유저의 인증키를 생성합니다.");
			userDto = new UserDto();
			userDto.setUserId(email);
			userDto.setAuthKey(authkey);
			userDto.setAuthState("0");
			sqlSession.getMapper(MemberDao.class).createAuthkey(userDto);
		}else {
			logger.debug("userEamil :"+ userDto.getUserId());
			logger.debug("usertoString :"+ userDto.toString());
			logger.debug("유저의 인증키를 변경합니다.");
			userDto.setAuthKey(authkey);
			sqlSession.getMapper(MemberDao.class).updateAuthkey(userDto);
			
		}
		
		// mail 작성 생성
		MailUtils sendMail = new MailUtils(mailSender);
		sendMail.setSubject("[Hoon's Board v2.0] 회원가입 이메일 인증");
		sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
				.append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
				.append("<a href='http://localhost/single/member/joinconfirm?email=")
				.append(userDto.getUserId())
				.append("&authKey=")
				.append(authkey)
				.append("' target='_blenk'>이메일 인증 확인</a>")
				.toString());
		sendMail.setFrom("singlekitri@gmail.com", "우리혼자산다");
		sendMail.setTo(userDto.getUserId());
		sendMail.send();
	}

	@Override
	public void updateAuthstatus(UserDto userDto) {
		sqlSession.getMapper(MemberDao.class).updateUserAuthState(userDto);
	}

}
