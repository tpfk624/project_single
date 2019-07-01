package com.kitri.single.group.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.single.group.contorller.GroupController;
import com.kitri.single.group.dao.GroupDao;
import com.kitri.single.group.model.GroupDto;
import com.kitri.single.user.model.UserDto;

@Service
public class GroupServiceImpl implements GroupService{
	
	//Autowired
	@Autowired
	private SqlSession sqlSession;
	
	//로그
	private static final Logger logger = LoggerFactory.getLogger(GroupServiceImpl.class);
	
	@Override
	public List<GroupDto> getGroupList(UserDto userInfo) {
		
		return sqlSession.getMapper(GroupDao.class).getGroupList(userInfo);
	}
}
