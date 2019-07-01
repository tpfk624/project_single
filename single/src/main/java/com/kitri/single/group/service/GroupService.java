package com.kitri.single.group.service;

import java.util.List;
import java.util.Map;

import com.kitri.single.group.model.GroupDto;
import com.kitri.single.user.model.UserDto;

public interface GroupService {

	public List<GroupDto> getGroup(Map<String, String> parameter, UserDto userInfo);

	public String getGroup(int num);

}
