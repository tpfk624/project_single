package com.kitri.single.sns.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.single.sns.dao.SnsDao;
import com.kitri.single.sns.model.SnsDto;
import com.kitri.single.user.model.UserDto;


@Service
public class NaverLoginServiceImpl implements NaverLoginService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public SnsDto getSnsLogin(SnsDto snsDto) {
		snsDto = sqlSession.getMapper(SnsDao.class).getSnsLogin(snsDto);
		return snsDto ;
	}
	
	
	//2019-07-08 백업
	@Override
	public UserDto getUser(String snsEmail) {
		UserDto userDto = sqlSession.getMapper(SnsDao.class).getUser(snsEmail);
		return userDto;
	}
	
	@Override
	public int registerUser(SnsDto userDto) {
		int result = sqlSession.getMapper(SnsDao.class).register(userDto);
		return result;
	}




}
