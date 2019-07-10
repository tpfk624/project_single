package com.kitri.single.member.dao;

import com.kitri.single.user.model.UserDto;

public interface MemberDao {
	int registCommon(UserDto userDto);
	int registSns(UserDto userDto);
	
	void createAuthkey(UserDto userDto);
	void updateAuthkey(UserDto userDto);
	UserDto getUser(UserDto userDto);
	void updateUserAuthState(UserDto user);
	UserDto login(UserDto userDto);
}

