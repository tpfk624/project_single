package com.kitri.login.user.service;

import org.springframework.stereotype.Service;

import com.kitri.single.dto.UserDto;

@Service
public class UserServiceImpl implements UserService {
	APIExamMemberProfile memberProfile;
	
	@Override
	public UserDto getUserService(String accessToken) {
		String jsonStr = memberProfile.getMemberProfile(accessToken);
		System.out.println(jsonStr);
		UserDto userDto = new UserDto();
		return null;
	}

}
