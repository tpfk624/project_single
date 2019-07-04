package com.kitri.single.member.dao;

import com.kitri.single.user.model.UserDto;

public interface MemberDao {
	void create(UserDto userDto);
	int regist(UserDto userDto);
	void updateAuthkey(UserDto userDto);
}

