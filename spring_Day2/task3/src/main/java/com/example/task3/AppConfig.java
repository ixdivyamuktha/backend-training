package com.example.task3;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AppConfig {

    @Bean
    public String simpleBean() {
        return "I am a manually defined bean";
    }
}