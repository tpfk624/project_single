package com.kitri.single.group.service;

import java.util.List;
import java.util.Map;

import com.kitri.single.group.model.GroupDto;
import com.kitri.single.user.model.UserDto;

public interface GroupService {

	//초기 그룹 리스트 셀렉트
	public List<GroupDto> getGroupList(Map<String, String> parameter);
	//특정 그룹 자세한 정보 가져오기
	public String getGroupDetail(int groupNum);

}
