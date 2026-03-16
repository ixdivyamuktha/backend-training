package com.example.task4;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class Main {
    public static void main(String[] args) {
        AnnotationConfigApplicationContext context =
                new AnnotationConfigApplicationContext(AppConfig.class);
        String msg = context.getBean("messageBean", String.class);
        System.out.println("Retrieved bean says: " + msg);
        context.close();
    }
}