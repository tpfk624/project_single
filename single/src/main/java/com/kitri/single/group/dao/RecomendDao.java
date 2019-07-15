package com.kitri.single.group.dao;

import java.util.List;
import java.util.Map;

import com.kitri.single.group.model.GroupDto;
import com.kitri.single.user.model.UserDto;

public interface RecomendDao {

	List<String> getRecommendTagList(UserDto userDto);

	List<String> getResultList(String parseTagStr);

	List<GroupDto> getGroupDtoList(List<String> resultList);

	List<GroupDto> getSingleRecommendList();

}
