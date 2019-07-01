package com.kitri.single.group.dao;

import java.util.List;

import org.springframework.stereotype.Controller;

import com.kitri.single.group.model.GroupDto;
import com.kitri.single.user.model.UserDto;


public interface GroupDao {
	
	//전체 조회
	public List<GroupDto> getGroupList(UserDto userInfo);
	
	//하나만 조회
	public GroupDto getGroup(int num);

}
