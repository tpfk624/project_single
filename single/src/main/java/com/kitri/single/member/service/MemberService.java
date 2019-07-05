package com.kitri.single.member.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;

import com.kitri.single.user.model.UserDto;

public interface MemberService {
	void regist(UserDto userDto);

	void sendAuthMail(String eamil) throws MessagingException, UnsupportedEncodingException;

	void updateAuthstatus(UserDto userDto);



	
}
