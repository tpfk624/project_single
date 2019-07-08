package com.kitri.single.member.dao;

import com.kitri.single.user.model.UserDto;

public interface MemberDao {
	int regist(UserDto userDto);
	void createAuthkey(UserDto userDto);
	void updateAuthkey(UserDto userDto);
	UserDto getUser(String email);
	void updateUserAuthState(UserDto user);
	UserDto login(UserDto userDto);
}

