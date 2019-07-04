package com.kitri.single.member.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.single.user.dao.UserDao;
import com.kitri.single.user.model.UserDto;



@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void regist(UserDto userDto) {
		int result = sqlSession.getMapper(UserDao.class).regist(userDto);
	}

}
