package com.kitri.single.group.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.single.group.contorller.GroupController;
import com.kitri.single.group.dao.HomeworkDao;
import com.kitri.single.group.model.HomeworkDto;
import com.kitri.single.util.SiteConstance;

@Service
public class HomeworkServiceImpl implements HomeworkService{
	
	@Autowired
	private SqlSession sqlSession;
	
	//로그
	private static final Logger logger = LoggerFactory.getLogger(GroupController.class);
	
	@Override
	public List<HomeworkDto> getHomeworkList(Map<String, String> parameter) {
		int page = Integer.parseInt(parameter.get("page"));
		int homeworkSize = SiteConstance.GROUP_HOMEWORK_SIZE;
				
		int endRow = page * homeworkSize;
		int startRow = endRow - homeworkSize;
		
		parameter.put("endRow", endRow + "");
		parameter.put("startRow", startRow + "");
		
		logger.info(parameter.toString());
		
		return sqlSession.getMapper(HomeworkDao.class).selectHomeworkList(parameter);
	}

	@Override
	public int homeworkRegister(HomeworkDto homeworkDto) {
		return sqlSession.getMapper(HomeworkDao.class).insertHomework(homeworkDto);
	}
	
	
	
}
