package com.kitri.single.naverlogin.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.single.naverlogin.dao.NaverUserDao;
import com.kitri.single.naverlogin.model.NaverUserDto;


public interface NaverLoginService {
	
	int registerUser(NaverUserDto naverUserDto);
}
