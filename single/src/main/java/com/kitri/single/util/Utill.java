package com.kitri.single.util;

import org.json.JSONObject;

public class Utill {
	
	public static String getStringJson(JSONObject obj , String key) {
		String value = obj.has(key) ? (String)obj.get(key): null;
		return value;
	}

}
