package com.kitri.single.home.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kitri.single.util.ApiConnection;

@Service
public class HomeServiceImpl implements HomeService{
	
	//미세먼지 API 호출
	//obvEwnaLdObges0rPROOPP0MNkIAQkTWtFkXdNXvga2%2BdzzDsPj%2B97ZQnMEcJBlCxAxEEg3Srtdb0XAVmKhoOA%3D%3D
	public String dustFromOpenApi(Map<String, String> parameter){
		String url = "http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getMsrstnAcctoRltmMesureDnsty";
		String serviceKey = "obvEwnaLdObges0rPROOPP0MNkIAQkTWtFkXdNXvga2%2BdzzDsPj%2B97ZQnMEcJBlCxAxEEg3Srtdb0XAVmKhoOA%3D%3D";
		String result = "";
		parameter.put("_returnType", "json");
		try {
//			String decodeServiceKey = URLDecoder.decode(serviceKey, "UTF-8");
//			String decodestationName = URLDecoder.decode(parameter.get("stationName"), "UTF-8");
//			String decodedataTerm = URLDecoder.decode(parameter.get("dataTerm"), "UTF-8");
			
			result = ApiConnection.apiConnection(url, parameter, "ServiceKey" , serviceKey);
			System.out.println(result);
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		System.out.println("서비스야.....");
		
		return result;
	}
}
