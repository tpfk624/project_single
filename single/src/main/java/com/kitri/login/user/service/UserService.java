package com.kitri.login.user.service;

import org.springframework.stereotype.Service;

import com.kitri.single.user.model.UserDto;


public interface UserService {

	public UserDto getUserService(String accessToken);
}
