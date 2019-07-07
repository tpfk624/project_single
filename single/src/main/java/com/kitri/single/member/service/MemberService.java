package com.kitri.single.member.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;

import com.kitri.single.user.model.UserDto;

public interface MemberService {
	void regist(UserDto userDto);

	UserDto sendAuthMail(UserDto userDto) throws MessagingException, UnsupportedEncodingException;

	void updateAuthstatus(UserDto userDto);





	
}
