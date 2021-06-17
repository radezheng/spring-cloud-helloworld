package com.example.demo;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.core.env.Environment;
import org.springframework.context.EnvironmentAware;

@RestController
public class HelloController {

    @Value("${application.message:Not configured by a Spring Cloud Server}")
    private String message;

	// @Autowired
	// Environment env = System.getenv();

    @GetMapping("/hello")
    public String hello() {
        return message + '\n' + "TESTEVN=" + System.getenv("TESTENV");
    }
}