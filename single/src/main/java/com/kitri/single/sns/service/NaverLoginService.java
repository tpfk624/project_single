package com.kitri.single.sns.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.single.sns.dao.NaverUserDao;
import com.kitri.single.sns.model.SnsDto;


public interface NaverLoginService {
	
	int registerUser(SnsDto naverUserDto);
}
