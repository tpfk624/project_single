package com.kitri.single.group.dao;

import java.util.List;

import org.springframework.stereotype.Controller;

import com.kitri.single.group.model.GroupDto;
import com.kitri.single.user.model.UserDto;


public interface GroupDao {

	List<GroupDto> getGroupList(UserDto userInfo);

}
