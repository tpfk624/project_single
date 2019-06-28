package com.kitri.single.naverlogin.controller;
//네이버 API 예제 - 회원프로필 조회
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class APIMemberProfile {

	public String getMemberProfile(String token) {
//	    String token = "YOUR_ACCESS_TOKEN";// 네이버 로그인 접근 토큰;
	     String header = "Bearer " + token; // Bearer 다음에 공백 추가
	     String result ="";
	     try {
	    	 // 사용자 프로필 정보 조회 요청 URL
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
	         result=response.toString();
	     } catch (Exception e) {
	         System.out.println(e);
	     }
	     return result;
	}
 
 
 
}
