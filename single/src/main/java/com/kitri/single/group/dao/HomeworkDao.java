package com.kitri.single.group.dao;

import java.util.List;
import java.util.Map;

import com.kitri.single.group.model.HomeworkDto;

public interface HomeworkDao {

	public int insertHomework(HomeworkDto homeworkDto);
	
	public HomeworkDto selectHomework(int homeworkNum);
	
	public List<HomeworkDto> selectHomeworkList(Map<String, Integer> parameter);

	public int selectListCount(int groupNum);

}
