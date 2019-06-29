package com.kitri.single.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.slf4j.Logger;

public class ApiConnection {
	
	/*
	 * urlstr : 접속주소
	 * parameter : 보내줘야 하는 값들 String 으로 바꿔서 보내줄것
	 * keyName : key보낼때 param 이름
	 * keyValue : 실제 key
	 * 응답을 String 객체로 반환
	 * 
	 * 예시 : 
	 * http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/kind?up_kind_cd=417000&ServiceKey=g066YY%2F%2Fd4D1%2FKBNzd4UniRDi8znS%2B9CpbjpSk25vo4Luk%2BdPR7sn%2FYr0WDMx1uMOlOa5mEkAvQJ85tWVP0XKw%3D%3D
	 * 라는 주소라면..
	 * 
	 * urlstr : http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/kind
	 * parameter : up_kind_cd  /  417000
	 * keyName : ServiceKey
	 * keyValue : g066YY%2F%2Fd4D1%2FKBNzd4UniRDi8znS%2B9CpbjpSk25vo4Luk%2BdPR7sn%2FYr0WDMx1uMOlOa5mEkAvQJ85tWVP0XKw%3D%3D
	 * */
	public static String apiConnection(String urlstr, Map<String, String> parameter, String keyName, String keyValue) throws IOException {
		StringBuffer uri = new StringBuffer(urlstr+"?");
		String result = "";
		
		Set<Entry<String, String>> params = parameter.entrySet();
		Iterator<Entry<String, String>> iter =  params.iterator();
		while(iter.hasNext()) {
			Entry<String, String> entry = iter.next();
			String key = URLEncoder.encode(entry.getKey(), "UTF-8");
			String value = URLEncoder.encode(entry.getValue() , "UTF-8");
			uri.append(key + "=");
			uri.append(value + "&");
		}
		uri.append(keyName + "=" + keyValue);
		System.out.println("uri : " + uri);
		BufferedReader in = null;
		try {
			URL url = new URL(uri.toString());
			URLConnection connection = url.openConnection();
			in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			String buffer = null;
			while((buffer = in.readLine()) != null) {
				result += buffer;
			}
		}finally {
			in.close();
		}
		
		return result;
	}
	
	
	public static void main(String[] args) {
		ApiConnection apiConnection = new ApiConnection();
		String urlPath = "http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/kind";
				//?up_kind_cd="+ animalCode + "&ServiceKey=";
		String serviceKey = "g066YY%2F%2Fd4D1%2FKBNzd4UniRDi8znS%2B9CpbjpSk25vo4Luk%2BdPR7sn%2FYr0WDMx1uMOlOa5mEkAvQJ85tWVP0XKw%3D%3D";
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("up_kind_cd", "417000");
		try {
			String result = apiConnection(urlPath, map, "ServiceKey", serviceKey);
			System.out.println(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
}
