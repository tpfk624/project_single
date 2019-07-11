package com.kitri.single.group.service;

import java.util.List;
import java.util.Map;

import com.kitri.single.group.model.HomeworkDto;

public interface HomeworkService {

	public List<HomeworkDto> getHomeworkList(Map<String, String> parameter);

	public int homeworkRegister(HomeworkDto homeworkDto);
	
	
}
