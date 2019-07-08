package com.kitri.single.util;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.json.JSONObject;
import org.springframework.web.multipart.MultipartFile;

public class Utill {
	
	public static String getStringJson(JSONObject obj , String key) {
		String value = obj.has(key) ? (String)obj.get(key): null;
		return value;
	}

	public static String profileUpload(MultipartFile multipartFile, String type, String realPath, String root) throws IllegalStateException, IOException {
		String originFile = multipartFile.getOriginalFilename();
		String src = "";
		realPath += "upload" + File.separator + type;
		File dir = new File(realPath);
		
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		String uuid = UUID.randomUUID().toString() + originFile.substring(originFile.lastIndexOf('.'));
		File file = new File(realPath, uuid);
		
		multipartFile.transferTo(file);
		src = root + "/upload/" + type + "/" + uuid;
		
		
		return src;
	}

}
