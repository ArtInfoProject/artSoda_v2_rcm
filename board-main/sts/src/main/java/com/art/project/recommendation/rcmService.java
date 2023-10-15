//package com.art.project.recommendation;
//
//import org.springframework.http.HttpEntity;
//import org.springframework.http.HttpHeaders;
//import org.springframework.http.MediaType;
//import org.springframework.stereotype.Service;
//import org.springframework.web.client.RestTemplate;
//
//@Service
//public class rcmService {
//	public String getRecommendations(String exhibitionTitle) {
//		RestTemplate restTemplate = new RestTemplate();
//
//		HttpHeaders headers = new HttpHeaders();
//		headers.setContentType(MediaType.APPLICATION_JSON);
//
//		HttpEntity<String> request = new HttpEntity<>("{\"exhibition_title\": \"" + exhibitionTitle + "\"}", headers);
//
//		String response = restTemplate.postForObject(
//				"http://localhost:5002/recommendations"
//				, request
//				, String.class
//				);
//		return response;
//	}
//}
