package com.kitri.single.hashtag.dao;

import java.util.List;
import java.util.Map;

import com.kitri.single.hashtag.model.HashtagDto;

public interface HashtagDao {
	public List<String> getHashtagList(Map<String, Integer> parameter);
	public void insertHashtag(HashtagDto hashtagDto);
}
