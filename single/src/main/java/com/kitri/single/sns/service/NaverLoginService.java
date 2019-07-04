package com.kitri.single.sns.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.single.sns.dao.SnsDao;
import com.kitri.single.sns.model.SnsDto;
import com.kitri.single.user.model.UserDto;


public interface NaverLoginService {
	
	UserDto getUser(String email);
	int registerUser(SnsDto naverUserDto);

	
}
