package com.kitri.single.hashtag.dao;

import java.util.List;
import java.util.Map;

public interface HashtagDao {
	public List<String> getHashtagList(Map<String, Integer> parameter);
}
