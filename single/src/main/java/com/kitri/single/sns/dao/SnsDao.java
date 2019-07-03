package com.kitri.single.sns.dao;

import com.kitri.single.sns.model.SnsDto;
import com.kitri.single.user.model.UserDto;

public interface SnsDao {
	public UserDto getUser(String snsEmail);
	public int register(SnsDto naverUserDto);

}
