package com.kitri.single.group.service;

import java.util.List;
import java.util.Map;

import com.kitri.single.group.model.HProgressDto;
import com.kitri.single.group.model.HomeworkDto;
import com.kitri.single.util.Pagination;

public interface HomeworkService {

	public Pagination<HomeworkDto> getHomeworkList(Map<String, String> parameter);

	public int homeworkRegister(HomeworkDto homeworkDto);

	public HomeworkDto getHomeworkDetail(int homeworkNum);

	public int hpCreate(HProgressDto hProgressDto);

	public HProgressDto getHp(HProgressDto hProgressDto);
	
	
}
