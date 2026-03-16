package com.example.task5;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Component;

@SpringBootApplication
public class Task5Application {
    public static void main(String[] args) {
        SpringApplication.run(Task5Application.class, args);
    }
}

@Component
class StartupRunner implements CommandLineRunner {
    @Value("${app.welcome:Default welcome}")
    private String welcome;

    @Override
    public void run(String... args) throws Exception {
        System.out.println("Custom property value: " + welcome);
    }
}