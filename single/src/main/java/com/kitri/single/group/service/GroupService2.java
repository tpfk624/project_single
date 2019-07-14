package com.kitri.single.group.service;

import java.util.List;
import java.util.Map;

import com.kitri.single.group.model.CalendarDto;
import com.kitri.single.group.model.GroupDto;
import com.kitri.single.group.model.GroupMemberDto;
import com.kitri.single.user.model.UserDto;

public interface GroupService2 {

	List<GroupDto> getRecommendGroupList(Map<String, Object> parameter);
	
}
