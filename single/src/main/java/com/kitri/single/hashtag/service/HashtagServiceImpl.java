package com.kitri.single.hashtag.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.single.hashtag.dao.HashtagDao;

@Service
public class HashtagServiceImpl implements HashtagService{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<String> getHashtagList(Map<String, Integer> parameter) {
		return sqlSession.getMapper(HashtagDao.class).getHashtagList(parameter);
	}

}
