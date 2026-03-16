package com.example.task2;

import org.springframework.stereotype.Service;

@Service
public class GreetingService {
    public String greet() {
        return "Hello from GreetingService";
    }
}