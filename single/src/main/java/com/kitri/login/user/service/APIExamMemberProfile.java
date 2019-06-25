package com.kitri.login.user.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.stereotype.Service;


public class APIExamMemberProfile {
	
	String getMemberProfile(String token){
	    String header = "Bearer " + token; // Bearer 다음에 공백 추가
	    String jsonStr="";
		try {
		    String apiURL = "https://openapi.naver.com/v1/nid/me";
		    URL url = new URL(apiURL);
		    HttpURLConnection con = (HttpURLConnection)url.openConnection();
		    con.setRequestMethod("GET");
		    con.setRequestProperty("Authorization", header);
		    int responseCode = con.getResponseCode();
		    BufferedReader br;
		    if(responseCode==200) { // 정상 호출
		        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		    } else {  // 에러 발생
		        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		    }
		    String inputLine;
		    StringBuffer response = new StringBuffer();
		    while ((inputLine = br.readLine()) != null) {
		        response.append(inputLine);
		    }
		    br.close();
		    jsonStr=response.toString();
//		        System.out.println(response.toString());
	    } catch (Exception e) {
	        System.out.println(e);
	    }
		return jsonStr;
	}
	
	 public static void main(String[] args) {
	        String token = "AAAANxmGkaOUShUsnKpCM9PRRCEka4qaZLtexm4vY9j2hYVAE7LYyi__0SazPHmRfRknfDhlDPC85NwFKRA__FveYnA";// 네이버 로그인 접근 토큰;
	    String header = "Bearer " + token; // Bearer 다음에 공백 추가
	    try {
	        String apiURL = "https://openapi.naver.com/v1/nid/me";
	        URL url = new URL(apiURL);
	        HttpURLConnection con = (HttpURLConnection)url.openConnection();
	        con.setRequestMethod("GET");
	        con.setRequestProperty("Authorization", header);
	        int responseCode = con.getResponseCode();
	        BufferedReader br;
	        if(responseCode==200) { // 정상 호출
	            br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	        } else {  // 에러 발생
	            br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	        }
	        String inputLine;
	        StringBuffer response = new StringBuffer();
	        while ((inputLine = br.readLine()) != null) {
	            response.append(inputLine);
	        }
	        br.close();
	        System.out.println(response.toString());
	    } catch (Exception e) {
	        System.out.println(e);
	    }
	}
}
