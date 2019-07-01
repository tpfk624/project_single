package com.kitri.single.naverlogin.controller;
//네이버 API 예제 - 회원프로필 조회
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class APIMemberProfile {
	public static final  String CLIENT_ID= "3FGMY2V_UXaBQxS0sx0g";
	public static final  String REDIRECT_URL="http://localhost/single/callback.jsp";
	public String getMemberProfile(String token) {
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
	}//getMemberProfile
 
	//state: //사이트 간 요청 위조 공격을 방지하기 위해 애플리케이션에서 생성한 상태 토큰으로 URL 인코딩을 적용한 값
	public String getMemberAuthorize(String token, String state) {
	     String result ="";
	     try {
//	    	 1) 발급:'authorization_code'
//	    	 2) 갱신:'refresh_token'
//	    	 3) 삭제: 'delete'
	    	 String grant_type ="grant_type";
	    	 String header = "Bearer " + token; // Bearer 다음에 공백 추가
	    	 String response_type ="code";
	    	 String client_id =CLIENT_ID;
	    	 String redirect_uri= REDIRECT_URL;
	    	 String apiURL = "https://nid.naver.com/oauth2.0/token";
	    	 apiURL+="?client_id="+client_id;
	    	 apiURL+="&response_type="+response_type;
	    	 apiURL+="&redirect_uri="+redirect_uri;
	    	 apiURL+="&state="+state;
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
