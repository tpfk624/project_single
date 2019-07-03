package com.kitri.single.user.service;

import java.util.List;

import com.kitri.single.user.model.UserDto;

public interface UserService {

	List<UserDto> memberList();

	void insertUser(UserDto dto);

	Object viewMember(String userId);

	boolean checkPw(String userId, String userPassword);

	void updateUser(UserDto dto);


}
