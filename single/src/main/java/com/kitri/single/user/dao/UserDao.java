package com.kitri.single.user.dao;

import com.kitri.single.user.model.UserDto;

public interface UserDao {
	void create(UserDto userDto);
	int register(UserDto userDto);
}

