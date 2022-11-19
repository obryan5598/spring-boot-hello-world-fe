package com.test.controller;

import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController  
public class FEController
{

	String endpoint = System.getenv("BACKEND-SERVICE-ENDPOINT");
	String port = System.getenv("BACKEND-SERVICE-PORT");
	String uri = "http://" + endpoint + ":" + port + "/getTimestamp";

	static final RestTemplate restTemplate = new RestTemplate();

	@Bean
	public RestTemplate restTemplate(RestTemplateBuilder builder) {
		return builder.build();
	}



	@RequestMapping("/")  
	public String hello()   
	{
		System.out.println(""); 
        System.out.println("Invoking getTimestamp REST API  " + uri);


		return restTemplate.getForObject(uri, String.class);

	}  
}
