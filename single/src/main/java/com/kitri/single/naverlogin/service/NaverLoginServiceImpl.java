package com.kitri.single.naverlogin.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.single.naverlogin.dao.NaverUserDao;
import com.kitri.single.naverlogin.model.NaverUserDto;


@Service
public class NaverLoginServiceImpl implements NaverLoginService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int registerUser(NaverUserDto userDto) {
		int result = sqlSession.getMapper(NaverUserDao.class).register(userDto);
		return result;
	}
}
