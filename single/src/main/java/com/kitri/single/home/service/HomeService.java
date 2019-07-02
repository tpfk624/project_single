package com.kitri.single.home.service;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.Charset;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

@Service
public interface HomeService {
	
	
	
	public default Object dustFromOpenApi(String stationName, String dataTerm) throws UnsupportedEncodingException {
		String url = "http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc&_returnType=json";
		String serviceKey = "obvEwnaLdObges0rPROOPP0MNkIAQkTWtFkXdNXvga2%2BdzzDsPj%2B97ZQnMEcJBlCxAxEEg3Srtdb0XAVmKhoOA%3D%3D";
		String decodeServiceKey = URLDecoder.decode(serviceKey, "UTF-8");
		String decodestationName = URLDecoder.decode(stationName, "UTF-8");
		String decodedataTerm = URLDecoder.decode(dataTerm, "UTF-8");
		
		System.out.println("서비스야.....");
		
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("application","json", Charset.forName("UTF-8")));
		
		UriComponents builder = UriComponentsBuilder.fromHttpUrl(url)
								.queryParam("serviceKey", decodeServiceKey)
								.queryParam("stationName", decodestationName)
								.queryParam("dataTerm", decodedataTerm)
								.queryParam("_returnType", "json")
								.build(false);
		System.out.println("으잉.......");
		System.out.println("나와줘.. : " + builder);
		
		Object response = restTemplate.exchange(builder.toUriString(), HttpMethod.GET, new HttpEntity<String>(headers), String.class);
		
		return response;
	}
	
}
