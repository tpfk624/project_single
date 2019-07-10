package com.kitri.single.sns.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.single.member.dao.MemberDao;
import com.kitri.single.sns.dao.SnsDao;
import com.kitri.single.sns.model.SnsDto;
import com.kitri.single.user.dao.UserDao;
import com.kitri.single.user.model.UserDto;


@Service
public class NaverLoginServiceImpl implements NaverLoginService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public SnsDto getSnsLogin(SnsDto snsDto) {
		return sqlSession.getMapper(SnsDao.class).getSnsLogin(snsDto);
	}
	

	@Override
	public void registSnsLogin(SnsDto snsDto) {
		sqlSession.getMapper(SnsDao.class).registSnsLogin(snsDto);
	}

	@Override
	public UserDto getUser(UserDto userDto) {
		return sqlSession.getMapper(MemberDao.class).getUser(userDto);
	}
	
//	@Override
//	public int registerUser(SnsDto userDto) {
//		int result = sqlSession.getMapper(SnsDao.class).register(userDto);
//		return result;
//	}






}
