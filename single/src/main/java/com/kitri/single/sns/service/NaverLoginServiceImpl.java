package com.kitri.single.sns.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.single.sns.dao.NaverUserDao;
import com.kitri.single.sns.model.SnsDto;


@Service
public class NaverLoginServiceImpl implements NaverLoginService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int registerUser(SnsDto userDto) {
		int result = sqlSession.getMapper(NaverUserDao.class).register(userDto);
		return result;
	}
}
