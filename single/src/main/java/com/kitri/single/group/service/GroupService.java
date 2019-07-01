package com.kitri.single.group.service;

import java.util.List;

import com.kitri.single.group.model.GroupDto;
import com.kitri.single.user.model.UserDto;

public interface GroupService {

	List<GroupDto> getGroupList(UserDto userInfo);

}
